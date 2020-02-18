class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
    @users = User.new
  end

  def edit

  end

  def show
  end

  def index
    @users = User.all.paginate(page: params[:page],per_page: 10)
  end

  def search
    @User = User.by_user_name(params[:search_text])
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "#{@user.id} User was successfully created"
        redirect_to user_path(@user.id)
      else
        flash.now[:error] = "invalid"
        render "new"
      end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "You have updated details of user #{@user.id}."
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = "You have not updated #{@user.id}."
      render :edit
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name,:last_name,:email,:image)
    end
  end