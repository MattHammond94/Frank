require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  # configure :development do
  #   register Sinatra::Reloader
  # end

  get '/names' do
    names = params[:names]
    return "#{names}"
  end

  post '/sort-names' do
    names = params[:names]
    names.split(",").sort.join(",")
  end

  get '/hello' do
    return erb(:index)
  end

  get '/greeting' do
    @name = params[:name]
    return erb(:greeter)
  end

  # get '/posts' do
  #   name = params[:name]
  #   cohort_name = params[:cohort_name]

  #   return "Hello #{name}, you are in the cohort #{cohort_name}"
  # end

  # post '/posts' do
  #   title = params[:title]

  #   return "Post was created with title: #{title}"
  # end

  # post '/submit' do
  #   name = params[:name]
  #   message = params[:message]

  #   return "Thanks #{name}, you sent this message: #{message}"
  # end
end
