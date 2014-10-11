# get '/users' do
#   erb :'users/my_profile'
# end

get '/users/login' do
  @login_error = false
  @user = User.new
  @message = " "
  erb :'users/login'
end

get '/users/logout' do
  session.clear
  redirect '/'
end

post '/login' do
  @user = User.find_by username: params[:username]
  if @user
    if @user[:password] == params[:password]
      session[:id] = @user[:id]
      redirect '/'
    else
      @login_error = true
      erb :'users/login'
    end
  else
    @user = User.new
    @login_error = true
    erb :'users/login'
  end
end

post '/signup' do
  if params[:password] == params[:validate_password]
    password = params[:password]
  else
    password = false
  end
  @user = User.new(
    username: params[:username],
    password: password
  )
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    erb :'/users/login' 
  end
end

# get '/users/:id' do
#   erb :'users'
# end