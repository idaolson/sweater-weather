require 'rails_helper'

RSpec.describe 'User endpoint' do
  it 'creates a user' do
    body = {
      "email": "ida@gmail.com",
      "password": "cassio",
      "password_confirmation": "cassio"
    }

    post '/api/v1/users', params: body

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)
    expect(user[:data][:type]).to eq("users")
  end

  it 'it returns error if email address already in use' do
    body = {
      "email": "doug@gmail.com",
      "password": "bianca",
      "password_confirmation": "bianca"
    }

    post '/api/v1/users', params: body

    body = {
      "email": "doug@gmail.com",
      "password": "cassio",
      "password_confirmation": "cassio"
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq("Email in use.")
  end

  it 'it returns error if passwords are not the same' do
    body = {
      "email": "doug@gmail.com",
      "password": "bianca",
      "password_confirmation": "cassio"
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq("Passwords do not match.")
  end

  it 'it returns error if field is empty' do
    body = {
      "email": "doug@gmail.com",
      "password": "bianca",
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq("Missing data.")
  end
end
