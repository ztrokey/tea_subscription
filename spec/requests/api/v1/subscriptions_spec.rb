require 'rails_helper'

RSpec.describe 'subscriptions' do
  describe 'create' do
    it 'creates a tea subscription' do
      customer = create(:customer)
      tea = create(:tea)

      subscription_params = {
        title: 'My first subscription',
        price: 12.5,
        tea_id: tea.id
      }

      post "/api/v1/customers/#{customer.id}/subscriptions", params: subscription_params

      expect(response).to be_successful
      response_data = JSON.parse(response.body, symbolize_names: true)

      expect(response_data).to be_a(Hash)
      expect(response_data).to have_key(:data)
      expect(response_data[:data]).to have_key(:id)
      expect(response_data[:data][:id]).to be_a(String)
      expect(response_data[:data]).to have_key(:type)
      expect(response_data[:data][:type]).to be_a(String)
      expect(response_data[:data]).to have_key(:attributes)
      expect(response_data[:data][:attributes]).to have_key(:price)
      expect(response_data[:data][:attributes][:price]).to be_a(Float)
      expect(response_data[:data][:attributes]).to have_key(:status)
      expect(response_data[:data][:attributes][:status]).to be_a(String)
      expect(response_data[:data][:attributes]).to have_key(:frequency)
      expect(response_data[:data][:attributes][:frequency]).to be_a(String)
      expect(response_data[:data][:attributes]).to have_key(:tea)
      expect(response_data[:data][:attributes][:tea]).to be_a(Hash)
      expect(response_data[:data][:attributes][:tea]).to have_key(:id)
      expect(response_data[:data][:attributes][:tea][:id]).to be_a(Integer)
      expect(response_data[:data][:attributes][:tea]).to have_key(:name)
      expect(response_data[:data][:attributes][:tea][:name]).to be_a(String)
      expect(response_data[:data][:attributes][:tea]).to have_key(:description)
      expect(response_data[:data][:attributes][:tea][:description]).to be_a(String)
      expect(response_data[:data][:attributes][:tea]).to have_key(:temperature)
      expect(response_data[:data][:attributes][:tea][:temperature]).to be_a(Integer)
      expect(response_data[:data][:attributes][:tea]).to have_key(:brew_time)
      expect(response_data[:data][:attributes][:tea][:brew_time]).to be_a(Integer)
      expect(response_data[:data][:attributes][:tea]).to have_key(:created_at)
      expect(response_data[:data][:attributes][:tea][:created_at]).to be_a(String)
      expect(response_data[:data][:attributes][:tea]).to have_key(:updated_at)
      expect(response_data[:data][:attributes][:tea][:updated_at]).to be_a(String)
    end
  end
  describe 'sad path' do
    it 'requires a tea' do
      customer = create(:customer)

      subscription_params = {
        title: 'My first subscription',
        price: 12.5
      }

      post "/api/v1/customers/#{customer.id}/subscriptions", params: subscription_params

      expect(response).to_not be_successful
      response_data = JSON.parse(response.body, symbolize_names: true)

      expect(response_data).to have_key(:error)
      expect(response_data[:error]).to be_a(String)
      expect(response_data).to have_key(:status)
      expect(response_data[:status]).to be_a(Integer)
    end
  end
  describe 'cancel' do
    it 'cancels a customers subscription' do
      customer = create(:customer)
      tea = create(:tea)
      subscription = customer.subscriptions.create!(
        title: 'Tea time!',
        price: 12.5,
        status: 'active',
        frequency: 'weekly',
        tea_id: tea.id
      )

      patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}"

      expect(response).to be_successful
      response_data = JSON.parse(response.body, symbolize_names: true)

      expect(response_data[:data][:attributes][:status]).to eq('canceled')
    end
  end
  describe 'index' do
    it 'shows all a customers subscriptions' do
      customer = create(:customer)
      create_list(:tea, 3)
      tea1 = Tea.first
      tea2 = Tea.second
      tea3 = Tea.last
      customer.subscriptions.create!(
        title: 'Tea time!',
        price: 12.5,
        status: 'active',
        frequency: 'weekly',
        tea_id: tea1.id
      )

      customer.subscriptions.create!(
        title: 'Pinkys out!',
        price: 9.99,
        status: 'canceled',
        frequency: 'monthly',
        tea_id: tea3.id
      )

      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response).to be_successful
      response_data = JSON.parse(response.body, symbolize_names: true)

      expect(response_data).to be_a(Hash)
      expect(response_data).to have_key(:data)
      expect(response_data[:data]).to be_an(Array)
      expect(response_data[:data].count).to eq(2)
      expect(response_data[:data].first[:attributes][:tea][:id]).to eq(tea1.id)
      expect(response_data[:data].last[:attributes][:tea][:id]).to eq(tea3.id)
    end
  end
end
