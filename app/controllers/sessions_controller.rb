class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    user_json = current_user.as_json.merge('authentication_token' => current_user.authentication_token)
    render(status: 200,
           json: { 
             success: true,
             info: 'Logged In',
             user: user_json})
  end
  
  def destroy
    warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    sign_out
    render(status: 200,
           json: {
             success: true,
             info: 'Logged Out'})
  end

  def failure
    render(status: 401,
           json: { 
             success: false,
             info: 'Login Credentials Failed'})
  end

  def show_current_user
    warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    render(status: 200,
           json: {
             success: true,
             info: 'Current User',
             user: current_user })
  end

end
