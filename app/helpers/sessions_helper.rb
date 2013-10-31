module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token  #cookies[:remember_token] = { value:   remember_token,
                                                         #expires: 20.years.from_now.utc } scrittura equivalente
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)  # particolare definizione di metodo in ruby
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    #calls the find_by method the first time current_user is called, but on subsequent invocations returns @current_    #user without hitting the database
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_out
   self.current_user= nil
   cookies.delete(:remember_token)
  end
end
