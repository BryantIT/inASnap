class SessionsController < ApplicationController

    def new
        #login view
    end 

    def create
        #byebug
       @user = User.find_by_username(params[:username])
        if @user == nil || @user.authenticate(params[:password]) == false
            redirect_to login_path
        else
            session[:user_id] = @user.id
            redirect_to user_path(@user)
           # byebug
        
        end 
        #processes fform
        #find user, authenticate passwrod set the session
    end 

    def destroy
        session.clear 
        redirect_to welcome_path
    end 


end 