# PE Jenkins CI

This module configures the Jenkins CI system to automate the spec tests for the
Facter project.  The module is designed to work with Puppet Enterprise and the
public [jenkins](https://github.com/rtyler/puppet-jenkins) module.

Facter is provides as an optional example Puppet class.  If you include the
pe\_jenkinsci class alone in a node's catalog then that node will have a fully
functional Jenkins service without any jobs configured.  In addition, including
the optional pe\_jenkinsci::facterjob class will demonstrate using Puppet to
manage additional jobs with Jenkins.

# Quick Start Install

This module needs to be installed on the Puppet Master system.  With Puppet
Enterprise already installed with the master role, these commands will put the
Puppet pe\_jenkinsci module in the correct place.

    % cd /etc/puppetlabs/puppet/modules
    % puppet-module install puppetlabs-pe_jenkinsci
    Installed "puppetlabs-pe_jenkinsci-0.0.1" into directory: pe_jenkinsci
    % cd pe_jenkinsci
    % /opt/puppet/bin/rake setup
    (in /etc/puppetlabs/puppet/modules/pe_jenkinsci)
    Cleaned module cache.
    Installed "rtyler-jenkins-0.0.1" into directory: jenkins

At the end of these commands the jenkins module will also be installed into
/etc/puppetlabs/puppet/modules/jenkins

At the time of this documentation, the jenkins module is not hosted on the
Forge so the rake setup task will install the jenkins module from the
resources directory of this module.

If you'd like to simply setup the Jenkins CI service and run the Facter test
suite on the same system running the Puppet Master, you can simply run:

    puppet apply -e 'include pe_jenkinsci'

# Usage

Once installed, a Puppet managed node can be easily configured to run the
Facter spec tests using the Jenkins CI system by simply adding the
pe\_jenkinsci and pe\_jenkinsci::facterjob classes to the Puppet Console.

If the Puppet Console is not being used as a node classifier (this is a Puppet
Enterprise installation option) then the class simply needs to be added to a
node definition on the Puppet Master like this:

    # /etc/puppetlabs/puppet/manifests/site.pp
    node testnode {
      include pe_jenkinsci
      include pe_jenkinsci::facterjob
    }

Then, on node "testnode" simply run puppet agent:

    root@testnode:~# puppet agent -t

Once Puppet Agent run, the Jenkins CI system should be running at:

    http://testnode:8080/

# RSpec Testing

This module has behavior tests written using [RSpec
2](https://www.relishapp.com/rspec).  The goal of these tests are to validate
the expected behavior of the module.  As more features and platform support are
added to this module the tests provide an automated way to validate the
expectations previous contributors have specified.

In order to validate the behavior, please run the `rake spec` task.

    % rake spec
    (in /Users/jeff/vms/puppet/modules/foo)
    .
    Finished in 0.31279 seconds
    1 example, 0 failures

## RSpec Testing Requirements

The spec tests require the `rspec-puppet` gem to be installed.  These tests
have initially be tested with the following integration of components in
addition to this module.  Modules such as
[stdlib](https://github.com/puppetlabs/puppetlabs-stdlib) may be checked out
into the same parent directory as this module.  The spec tests will
automatically add this parent directory to the Puppet module search path.

 * rspec 2.6
 * rspec-puppet 0.1.0
 * puppet 2.7.6
 * facter 1.6.3
 * stdlib 2.2.0

## Installing RSpec Testing Requirements

To install the testing requirements:

    % gem install rspec-puppet --no-ri --no-rdoc
    Successfully installed rspec-core-2.7.1
    Successfully installed diff-lcs-1.1.3
    Successfully installed rspec-expectations-2.7.0
    Successfully installed rspec-mocks-2.7.0
    Successfully installed rspec-2.7.0
    Successfully installed rspec-puppet-0.1.0
    6 gems installed

## Adding Tests

Please see the [rspec-puppet](https://github.com/rodjek/rspec-puppet) project
for information on writing tests.  A basic test that validates the class is
declared in the catalog is provided in the file `spec/classes/*_spec.rb`.
`rspec-puppet` automatically uses the top level description as the name of a
module to include in the catalog.  Resources may be validated in the catalog
using:

 * `contain_class('myclass')`
 * `contain_service('sshd')`
 * `contain_file('/etc/puppet')`
 * `contain_package('puppet')`
 * And so forth for other Puppet resources.

EOF
