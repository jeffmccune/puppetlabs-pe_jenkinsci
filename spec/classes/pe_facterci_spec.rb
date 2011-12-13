require 'spec_helper'

# Note, rspec-puppet determines the class name from the top level describe
# string.
describe 'pe_facterci' do
  it { should contain_class 'pe_facterci' }
end
