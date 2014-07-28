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
          # TODO: update controller to return 401? - for now it 301 redirects to ENV['HTTP_HOST']
          post :create, { user: { email: user.email, password: 'invalid' } }
          response.status.must_equal 302
          # TODO: assert the user has been logged out!
        end
      end

      describe 'With valid email/password' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do
          # TODO: update controller to return 200? - for now it 301 redirects to ENV['HTTP_HOST']
          post :create, { user: { email: user.email, password: password } }
          response.status.must_equal 302
        end
      end

      describe 'With valid username/password' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do
          skip 'implement authentication by username'
          # TODO: update controller to return 200? - for now it 301 redirects to ENV['HTTP_HOST']
          post :create, { user: { email: user.username, password: password } }
          response.status.must_equal 302
        end
      end
    end

    describe '#destroy' do
      it 'returns 200' do
        post :destroy
        response.status.must_equal 200
        json = JSON.parse(response.body)
        json['info'].must_equal 'Logged Out'
      end
    end

    describe '#failure' do; end
    describe '#show_current_user' do
      it 'returns 200 & the user JSON' do
        # TODO: decide whether this should also return the auth token or whether that should be reserved for sessions#create
        get :show_current_user
        response.status.must_equal 200
        json = JSON.parse(response.body)
        json['info'].must_equal 'Current User'
        json['user']['email'].must_equal user.email
      end
    end
  end

  describe 'When the user is not logged in' do
    describe '#create' do
      describe 'With invalid creds' do
        it 'returns 401' do
          post :create, { user: { email: user.email, password: 'invalid' } }
          response.status.must_equal 401
        end
      end

      describe 'With valid email/password' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do
          post :create, { user: { email: user.email, password: password } }
          response.status.must_equal 200
          json = JSON.parse(response.body)
          json['info'].must_equal 'Logged In'
          json['user']['email'].must_equal user.email
        end
      end

      describe 'With valid username/password' do
        it 'returns 200, the user JSON, & an auth token with valid creds' do
          skip 'implement authentication by username'
          post :create, { user: { email: user.username, password: password } }
          response.status.must_equal 200
        end
      end
    end

    describe '#destroy' do
      it 'returns 401' do
        post :destroy
        response.status.must_equal 401
      end
    end

    describe '#failure' do; end

    describe '#show_current_user' do
      it 'returns 401' do
        get :show_current_user
        response.status.must_equal 401
      end
    end
  end
end