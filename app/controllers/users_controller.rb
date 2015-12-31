class UsersController < ApplicationController
  before_action :select_user, only: [:show, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    validate_permission!(set_topic)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to root_url, notice: 'Aramıza hoş geldin.'
    else
      render :new
    end
  end

  def show
    sayfa = params[:sayfa] || 'konular'
    
    if sayfa == 'konular'
      @data = @user.topics
     else
      @data = @user.comments
    end
    
    render layout: '_profile', locals: {page: sayfa}
  end

  def edit
    render layout: '_profile'
  end

  def update
    if @user.update(user_params)
      redirect_to profile_url(@user), notice: 'Profil bilgileriniz güncellendi.'
    else
      render :edit, layout: '_profile'
    end
  end

  def destroy
    logout
    @user.destroy
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit!
  end

  def select_user
    @user = User.find_by_username(params[:id])
  end

  def allowed?
    user = select_user

    unless current_user == user
      redirect_to profile_path(user), alert: 'Bunu yapmaya yetkiniz yok!'
    end
  end
  
  def set_topic
      @user
  end
end
