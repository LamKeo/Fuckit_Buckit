class BuckitController < ApplicationController

# enable :sessions
#routes to the home page
get '/' do
 erb :home
end

get '/createbuckit' do
  authorization_check
  @user_name = session[:current_user].user_name
  erb :buckit_setup
end

post '/createbuckit' do
  authorization_check
  @user_name = session[:current_user].user_name
  @buckit = Buckit.new
  @buckit.buck = params[:buck]
  @buckit.save
  buckup = @buckit
    p 'fuck buckup'

  session[:current_user] = @user
  current_user = @user
  redirect '/buckethome' #make this!

  erb :buckit_setup
end

get '/buckethome' do
  erb :buckit_home
end

post '/buckethome' do

end
#to add fuck to bucket
get '/addfuck/:id' do
  @buckit = Buckit.find_by(params[:id])
  erb :buckit_home
end
#to add fuck to bucket
post '/addfuck' do
  @buckit = Buckit.find_by(params_[:id])
  @buckit.buck = params[:buck]
  @buckit.save
  @user_name = session[:current_user].user_name

  erb :buckit_home
end
  get '/not_authorized_for_fuckit' do
    erb :not_authorized_for_fuckit
  end

 get '/file_not_found' do
   erb :file_not_found
 end


end #end of BuckitController class
