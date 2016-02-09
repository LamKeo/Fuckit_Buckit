class AccountController < ApplicationController

  get '/' do
    erb :home
  end

  #user registration, we want to make this be on the same page, side by side
  get '/register' do
    erb :signin
  end

#user registration post
  post '/register' do
    #binding.pry
    if does_username_exist(params[:user_name]) == true

      return {:message =>'Sorry, that username already exists. '}.to_json
    elsif (params[:user_email] != '' && params[:user_name] != '' && params[:password] != '')
      #binding.pry
      @user = Account.new
      @user.user_email = params[:user_email]
      @user.user_name = params[:user_name]
      @user.password = params[:password]#research/ask how do you add the image and color we want to assign to it?
      @user.save
      session[:current_user] = @user
      current_user = @user
      # p 'redirect'
      redirect '/buckethome'
    else
      # p 'no fucks'
      @message = "You may have no fucks to give, but please fill in all the fields!"
      erb :not_authorized_for_fuckit
    end
end

#user login, we want to make this be on the same page, side by side
get '/login' do
  erb :signin
end

post '/login' do
  @user = Account.authenticate(params[:user_name], params[:password])
    if @user
      session[:current_user] = @user
      redirect '/buckethome'
    else
        return {:message => "You may give no fucks but your username and password have to be correct!"}.to_json
        redirect '/account/signin'
    end
end

get '/not_authorized_for_fuckit' do
  erb :not_authorized_for_fuckit
end


get '/logout' do
  authorization_check
  session[:current_user] = nil
  erb :logout
end



end #end of AccountController
