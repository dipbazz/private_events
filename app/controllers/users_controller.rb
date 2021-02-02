class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index; end

  # GET /users/1 or /users/1.json
  def show
    @upcoming_events = current_user.upcoming_events
    @past_events = current_user.previous_events
    @created_events = current_user.events
  end

  # GET /users/new
  def new
    if session[:current_user_id]
      flash[:notice] = 'You are already logged in.'
      return redirect_to users_path
    end
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.find_or_create_by(user_params)

    respond_to do |format|
      session[:current_user_id] = @user.id
      format.html { redirect_to @user, notice: 'You are logged in successfully.' }
      format.json { render :show, status: :created, location: @user }
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    session[:current_user_id] = nil
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'You are successfully logged out.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user).permit(:username)
  end
end
