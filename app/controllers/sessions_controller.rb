class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.find_by(username: params[:session][:username])
      session[:id]= user.id
      # if user && user.authenticate(params[:session][:password])
      #   redirect_to user
      # else
      #   flash.now[:errors] = "Invalid login"
      #   render :new
      # end
    end

    def destroy
      session.clear
      redirect_to login_path
    end

end
