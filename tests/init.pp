# This example adds the pe_jenkinsci class to all nodes.  Note, the class
# requires the jenkins class to work properly.

node default {
  include pe_jenkinsci
  include pe_jenkinsci::facterjob
}
