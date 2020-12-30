# app.rb

require 'sinatra/base'
require 'sinatra/reloader'

# SinatraApp class

class MyApp < Sinatra::Base
  # for auto reloading website
  configure :development do
    register Sinatra::Reloader
  end

  # routes
  # this will show the home page
  get '/' do
    puts 'request'
    erb :home
  end

  get '/table1' do
    erb :table, :locals => { :table_data =>  get_data }, layout: false
  end

  get '/pai' do
    'Hello Pai!'
  end

  # dynamic route, params hash will contain all route variables
  get '/:first_name*' do
    "Hello #{params[:first_name].capitalize}"
  end

  def get_data
     sleep 5
    [%w[Kay Box kaybox], %w[ Dan Elgar elgar]]
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
