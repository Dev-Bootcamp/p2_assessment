get '/' do
  # render home page
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
  end
  redirect '/'
end

get '/sessions/:id' do
  # sign-out
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  user = User.create(email: params[:user][:email], password: params[:user][:password], first_name: params[:user][:first_name], last_name: params[:user][:last_name], birthdate: params[:user][:birthdate])
  session[:user_id] = user.id
  redirect '/'
end
