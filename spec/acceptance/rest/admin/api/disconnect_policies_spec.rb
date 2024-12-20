# frozen_string_literal: true

require 'rspec_api_documentation/dsl'

RSpec.resource 'Disconnect policies' do
  include_context :acceptance_admin_user
  let(:type) { 'disconnect-policies' }

  get '/api/rest/admin/disconnect-policies' do
    jsonapi_filters Api::Rest::Admin::DisconnectPolicyResource._allowed_filters

    before { create_list(:disconnect_policy, 2) }

    example_request 'get listing' do
      expect(status).to eq(200)
    end
  end

  get '/api/rest/admin/disconnect-policies/:id' do
    let(:id) { create(:disconnect_policy).id }

    example_request 'get specific entry' do
      expect(status).to eq(200)
    end
  end

  post '/api/rest/admin/disconnect-policies' do
    parameter :type, 'Resource type (disconnect-policies)', scope: :data, required: true

    jsonapi_attributes([:name], [])

    let(:name) { 'name' }

    example_request 'create new entry' do
      expect(status).to eq(201)
    end
  end

  put '/api/rest/admin/disconnect-policies/:id' do
    parameter :type, 'Resource type (disconnect-policies)', scope: :data, required: true
    parameter :id, 'Disconnect policy ID', scope: :data, required: true

    jsonapi_attributes([:name], [])

    let(:id) { create(:disconnect_policy).id }
    let(:name) { 'name' }

    example_request 'update values' do
      expect(status).to eq(200)
    end
  end

  delete '/api/rest/admin/disconnect-policies/:id' do
    let(:id) { create(:disconnect_policy).id }

    example_request 'delete entry' do
      expect(status).to eq(204)
    end
  end
end
