get '/' do
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
  end
  redirect '/'
end

get '/sessions/:id' do
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :user
end

post '/users' do
  user = User.create(email: params[:user][:email], password: params[:user][:password], first_name: params[:user][:first_name], last_name: params[:user][:last_name], birthdate: params[:user][:birthdate])
  session[:user_id] = user.id
  redirect '/'
end

#------------ EVENTS -------------

get '/event/:id' do
  @event = Event.find(params[:id])
  erb :event
end

get '/new_event' do
  erb :new_event
end

get '/edit/:id' do
  @event = Event.find(params[:id])
  erb :edit_event
end

get '/delete/:id' do
  Event.find(params[:id]).destroy
  redirect '/'
end

post '/events' do
  event = Event.create(user_id: params[:event][:user_id], name: params[:event][:name], location: params[:event][:location], starts_at: params[:event][:starts_at], ends_at: params[:event][:ends_at])
  if request.xhr?
    content_type :json
    event.to_json
  else
    redirect "/event/#{event.id}"
  end
end

post '/edit_event' do
  event = Event.find(params[:event][:id])
  event.update_attributes(name: params[:event][:name], location: params[:event][:location], starts_at: params[:event][:starts_at], ends_at: params[:event][:ends_at])
  redirect "/event/#{event.id}"
end











