require 'spec_helper'

# TODO: test remember_me

describe SessionsController do
  include Devise::TestHelpers

  before { @request.env["devise.mapping"] = Devise.mappings[:user] }
  let(:password) { 'password' }
  let(:user) { User.create!(username: 'foobar',
                           email: 'foo@bar.com',
                           password: password) }

  describe 'When the user is already logged in' do
    before { sign_in user }

    describe '#create' do
      describe 'With invalid creds' do
        it 'logs the user out and then returns 401' do
          post :create, { email: user.email, password: 'invalid' }
          response.status.must_equal 401
          # TODO: assert the user has been logged out!
        end
      end

      describe 'With valid email/password' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do

        end
      end

      describe 'With valid username/password' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do

        end
      end
    end

    describe '#destroy' do

    end

    describe '#failure' do; end
    describe '#show_current_user' do; end
  end

  describe 'When the user is not logged in' do
    describe '#create' do
      describe 'With invalid creds' do
        it 'returns 401' do
          post :create, { email: user.email, password: 'invalid' }
          response.status.must_equal 401
        end
      end

      describe 'With valid email/password' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do
          post :create, { email: user.email, password: password }
          response.status.must_equal 200
        end
      end

      describe 'With valid username/password' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do
          post :create, { email: user.email, password: password }
          response.status.must_equal 200
        end
      end
    end

    describe '#destroy' do

    end

    describe '#failure' do; end
    describe '#show_current_user' do; end
  end
end