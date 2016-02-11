require 'spec_helper'
describe 'snapdrived' do

  context 'with defaults for all parameters' do
    it { should contain_class('snapdrived') }
  end
end
