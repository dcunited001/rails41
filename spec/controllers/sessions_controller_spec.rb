require 'spec_helper'

# TODO: test remember_me

describe SessionsController do
  include Devise::TestHelpers

  before { @request.env["devise.mapping"] = Devise.mappings[:user] }
  let(:password) { 'password' }
  let(:user) { User.create!(username: 'foobar',
                           email: 'foo@bar.com',
                           password: password) }

  describe '#create' do
    describe 'When already logged in' do
      before { sign_in user }

      it 'returns 401 with invalid creds and logs the user out' do

      end

      describe 'authentication with email' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do

        end
      end

      describe 'authentication with username' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do

        end
      end

    end

    describe 'When not logged in' do
      it 'returns 401 with invalid creds' do
        post :create, { email: user.email, password: 'invalid' }
        response.status.must_equal 401
      end

      describe 'authentication with email' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do
          post :create, { email: user.email, password: password }
          response.status.must_equal 200
        end
      end

      describe 'authentication with username' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do
          post :create, { email: user.email, password: password }
          response.status.must_equal 200
        end
      end
    end
  end

  describe '#destroy' do; end
  describe '#failure' do; end
  describe '#show_current_user' do; end

  describe 'User is not already logged in' do
    # create a user with a specific auth token

    describe 'Correct user/pass is used' do

    end

    describe 'Incorrect user/pass is used' do

    end
  end

  describe 'User is already logged in' do

  end
end