require 'spec_helper'

# Note, rspec-puppet determines the class name from the top level describe
# string.
describe 'pe_jenkinsci' do
  it { should contain_class 'pe_jenkinsci' }
end
