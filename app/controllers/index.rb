get '/' do
  @posts = Post.all
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do 
  user = User.find_by_email(params[:login][:email])
  if user == user.authenticate(params[:login][:password]) 
    session[:user_id] = user.id 

    redirect '/'
  else
    redirect '/login'
  end
end

post '/signup' do 
  User.create(params[:signup])
  redirect '/'
end

before '/submit' do
  redirect '/login' unless session[:user_id]
end

get '/submit' do
  erb :submit
end

post '/submit' do
  info = params[:submit]
  info[:user_id] = session[:user_id]
  p Post.create(info)
  redirect '/'
end

post '/postcomment/:post_id' do
  if session[:user_id]
    p params
    info = {}
    info[:body] = params[:body]
    info[:post_id] = params[:post_id]
    info[:user_id] = session[:user_id]
    Comment.create(info)
  end
  redirect '/#{params[:post_id]}'
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/:id' do
  @id = params[:id]
  @comments = Post.find(params[:id]).comments
  erb :comments
end

