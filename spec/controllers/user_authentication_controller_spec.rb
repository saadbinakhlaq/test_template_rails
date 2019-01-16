require 'rails_helper'

RSpec.describe UserAuthenticationController do
  before do
    create(:user, email: 'email@example.com', password: '123456')
  end

  context 'when correct credentials are provided' do
    subject do
      post 'authenticate', params: {
        "user": {
          "email": "email@example.com",
          "password": "123456"
        }
      }, format: :json
    end

    it 'responds with status created' do
      subject
      expect(response).to have_http_status(:created)
    end
  end

  context 'when correct credentials are not provided' do
    subject do
      post 'authenticate', params: {
        "user": {
          "email": "email@example.com",
          "password": "1234"
        }
      }, format: :json
    end

    it 'responds with status forbidden' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end
end