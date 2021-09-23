class SessionsController < ApplicationController
    before_action :require_user_login, only: [:user_destroy]
    def new
    end
    def login
    end
    def valid_login
      @user = Usuario.find_by_email(params['usuario'][:email])
      if @user != nil
        #if @user.try(:authenticate, params['usuario'][:password]) == false
        if @user[:password] != params['usuario'][:password]
            flash[:errors] = "Email o Password erroneo"
            redirect_to "/"
        else
          session[:user_id] = @user.id
          if helpers.superadmin_valid(@user)
            redirect_to establecimientos_path
          else
            redirect_to '/establecimientos/' + Registro.find_by(usuario:@user).establecimiento_id.to_s
          end
        end
      else
        flash[:errors] = "Email o Password erroneo"
        redirect_to "/"
      end
    end
  
    def destroy
      session.clear
      redirect_to '/'
    end
    def user_destroy
      session[:user_id] = nil
      redirect_to "/"
    end
  
    private
    def require_user_login
      if session[:user_id] == nil
        redirect_to "/"
      end
    end
end

