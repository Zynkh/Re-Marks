enable :sessions

helpers do

  def login?
    if session[:id].nil?
      return false
    else
      return true
    end
  end

  def username
    User.find(session[:id]).username
  end
end