class ApplicationController < Sinatra::Base

require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :database => 'dkaibtd4gk3tb', #datbase name
  :adapter => 'postgresql'
)

#enables the sessions
  enable :sessions

#This tells the controller where to look for the views & public folder
  set :views, File.expand_path('../../views', __FILE__)
  set :public_dir, File.expand_path('../../public', __FILE__)


#to find out if user already exists
def does_username_exist(username)
  user = Account.find_by(:user_name => username)
  if user
    return true
  else
    return false
  end
end

#check if user is in a active session
def authorization_check
  if session[:current_user] == nil
    # redirect '/account/not_authorized'
    erb :not_authorized_for_fuckit
  else
    return true
  end
end

end #end of class
