require 'rails_helper'

RSpec.describe 'Session endpoint' do
  it 'creates a session' do
    body = {
      "email": "ida@gmail.com",
      "password": "cassio",
      "password_confirmation": "cassio"
    }

    post '/api/v1/users', params: body

    body = {
      "email": "ida@gmail.com",
      "password": "cassio"
    }

    post '/api/v1/sessions', params: body

    expect(response).to be_successful
    expect(response.status).to eq(200)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:data)
    expect(result[:data]).to be_a(Hash)
    expect(result[:data][:type]).to eq("users")
  end

  it 'returns error if credentials are incorrect/nonexistent' do
    body = {
      "email": "ida@gmail.com",
      "password": "cassio",
      "password_confirmation": "cassio"
    }

    post '/api/v1/users', params: body

    body = {
      "email": "ida@gmail.com",
      "password": "bianca"
    }

    post '/api/v1/sessions', params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq("Invalid credentials.")
  end
end
