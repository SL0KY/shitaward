class SessionsController < ApplicationController
    def new

    end

    def create
        @user = User.find_by(email: sessions_params[:email])
        if @user.try(:authenticate, sessions_params[:password])
            raise @user.inspect
        else
            raise "pas bon".inspect
        end
    end

    private

    def sessions_params
        params.require(:session).permit(%i[email password])
    end
end