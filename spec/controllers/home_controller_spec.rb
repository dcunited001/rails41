require 'spec_helper'

describe HomeController do
  it 'returns the single page app template' do
    get :index
    response.status.must_equal 200
    response.body.must_include '<html ng-app'
  end
end