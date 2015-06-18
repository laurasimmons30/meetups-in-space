require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'omniauth-github'

require_relative 'config/application'

Dir['app/**/*.rb'].each { |file| require_relative file }

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end

  def signed_in?
    current_user.present?
  end
end

def set_current_user(user)
  session[:user_id] = user.id
end

def authenticate!
  unless signed_in?
    flash[:notice] = 'You need to sign in if you want to do that!'
    redirect '/index'
  end
end


get '/auth/github/callback' do
  auth = env['omniauth.auth']

  user = User.find_or_create_from_omniauth(auth)
  set_current_user(user)
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/index'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/index'
end

get '/example_protected_page' do
  authenticate!
end

get '/' do
  redirect '/index'
end

get '/index' do
  meetups = Meetup.order(:name)
  erb :index, locals: {meetups: meetups}
end

get '/index/details/:id' do
  authenticate!
  meetups = Meetup.find(params[:id])
  erb :details, locals: {meetups: meetups }
end

post '/index/details/add/:id' do
  Usermeetup.create(user_id: current_user.id, meetup_id: Meetup.find(params[:id]).id)
    flash[:notice] = "You've joined this group!"
  redirect "/index/details/#{params[:id]}"
end

post '/index/details/remove/:id' do
  binding.pry
  Usermeetup.find_by(user_id: current_user.id,meetup_id: Meetup.find(params[:id]).id).destroy_all
  flash[:notice] = "You have left this group"
  redirect "/index/details/#{params[:id]}"
end

get '/index/add' do
  authenticate!
  categories = Category.all
  locations = Location.all
  erb :add, locals: {categories: categories, locations: locations}
end

post '/index/add' do 
  Meetup.create(
  name: "#{params['name']}",
  location: Location.find_by(name: params['location']),
  description: "#{params['description']}"
  )
  flash[:notice] = "Your group has been added!"

  redirect '/index'
end

get '/index/profile' do 
  authenticate!
  erb :profile
end
