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
  meetups = Meetup.all
  erb :index, locals: {meetups: meetups}
end

get '/index/details/:id' do
  authenticate!
  meetups = Meetup.find(params[:id])
  binding.pry
  erb :details, locals: {meetups: meetups }
end

post '/index/details' do
end

get '/index/add' do
  authenticate!
  categories = Category.all
  locations = Location.all
  erb :add, locals: {categories: categories, locations: locations}
end

post '/index/add' do 
  binding.pry
  Meetup.create(
  name: "#{params['name_of_the_group']}",
  location: "#{Location.find_by name: params['location']}",
  description: "#{params['descripton']}",
  )

  redirect '/index/details/#{Meetup.last}'
end

get '/index/profile' do 
  authenticate!
  erb :profile
end
