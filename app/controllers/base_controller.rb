class BaseController < ApplicationController
  acts_as_token_authentication_handler_for User, fallback_to_devise: true
  before_filter :authenticate_user!
end