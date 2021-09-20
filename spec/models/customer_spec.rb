require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many(:subscriptions).dependent(:destroy) }
    it { should have_many(:teas).through(:subscriptions) }
  end
end
