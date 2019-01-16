require 'rails_helper'

RSpec.describe UserAuthenticationController do
  let(:email) { 'email@example.com' }
  let(:password) { '123456' }

  before do
    create(:user, email: email, password: password)
  end

  context 'when correct credentials are provided' do
    subject do
      post :authenticate, params: {
        'user': {
          'email': email,
          'password': password
        }
      }, format: :json
    end

    it 'responds with status created' do
      subject
      expect(response).to have_http_status(:created)
    end

    it 'should have a valid json response' do
      subject
      expect(response.body).to have_json_path('user/auth_token')
    end
  end

  context 'when correct credentials are not provided' do
    subject do
      post :authenticate, params: {
        'user': {
          'email': email,
          'password': '1234'
        }
      }, format: :json
    end

    it 'responds with status forbidden' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end
end