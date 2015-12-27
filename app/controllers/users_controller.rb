class UsersController < ApplicationController
  before_action :select_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to profile_path(@user), notice: 'Aramıza hoş geldin.'
    else
      render :new
    end
  end

  def show
    @data = []

    if params[:sayfa]
      render layout: '_profile', locals: {page: params[:sayfa]}
    else
      render layout: '_profile', locals: {page: 'konular'}
    end
  end

  def edit
    render layout: '_profile'
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: 'Profil bilgileriniz güncellendi.'
    else
      render :edit, layout: '_profile'
    end
  end

  def destroy
    @user.destroy
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit!
  end

  def select_user
    @user = User.find_by_username(params[:id])
  end
end
