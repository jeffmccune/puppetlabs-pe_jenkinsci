# Class: pe_jenkinsci
#
# This module uses the jenkins module and builds upon it to automatically
# configure a job that runs the Facter spec tests.
#
# This module is primarily intended as an example of how to re-use other
# modules with Puppet Enterprise.
#
# Parameters:
#
# Actions:
#
# Requires:
#
#  * Class[jenkins]
#  * Class[jenkins::git]
#  * Class[jenkins::service]
#
# Sample Usage:
#
#     puppet apply -v -e 'include pe_jenkinsci'
#
class pe_jenkinsci {

  ## We need to build gems for the PE platform
  # include pe_devel
  ## We need the FOSS jenkins module
  include jenkins
  # Manage the Jenkins Git plugin
  include jenkins::git
  Class[jenkins] -> Class[jenkins::git]
  # Notify the service
  Class[jenkins::git] ~> Class[jenkins::service]

  ## We need the jenkins.rb Gem
  # include pe_jenkinsci::ruby
  ## Reach the user story goal and configure Facter Spec Tests
  # include pe_jenkinsci::facterjob

}
