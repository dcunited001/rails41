class UsersController < BaseController
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  def update; end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
