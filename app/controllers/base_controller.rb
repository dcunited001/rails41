class BaseController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_filter :authenticate_user!
end