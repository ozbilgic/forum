class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :signed_in?, :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user
  end

  def login(user)
    session[:user_id] = user.id
  end
  
  def logout
    session[:user_id] = nil
  end
  
  def validate_user!
    unless signed_in?
      #oturum açılmamışsa giriş paneline yönlendirir.
      #TODO: oturum açıldıktan sonra kullanıcıyı geldiği adrese gönder.
      redirect_to login_url, alert: 'Bu sayfaya erişebilmek için oturum açmalısınız.'
    end
  end
  
  def validate_permission!(user)
    unless current_user == user
      redirect_to root_url, alert: 'Bu işlemi gerçekleştiremezsiniz!'
    end
  end
end
