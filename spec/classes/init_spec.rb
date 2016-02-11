require 'spec_helper'
describe 'snapdrive' do

  context 'with defaults for all parameters' do
    it { should contain_class('snapdrive') }
  end
end
