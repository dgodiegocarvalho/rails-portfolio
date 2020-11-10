class SessionsController < ApplicationController
    def new
        redirect_to user_path(current_user) if user_signed_in?
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            sign_in(user)
            if user_admin?
                redirect_to users_path
            else
                redirect_to user_path(current_user)
            end
            flash.now[:success] = 'Usuário logado com sucesso'
        else
            flash.now[:danger] = 'Email e Senha inválidos'
            render 'new'
        end
    end

    def destroy
        sign_out
        flash[:warning] = 'Logout realizado com sucesso'
        redirect_to root_url
    end
end
