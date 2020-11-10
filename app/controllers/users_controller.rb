class UsersController < ApplicationController
    before_action :require_logged_in_user, only: [:show, :edit, :update, :index]
    
    def index
      if user_admin?
        @users = User.all
      else
        redirect_to user_path(current_user)
      end
    end
    
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
	    if @user.save
	      flash[:success] = 'Cadastro realizado com sucesso'
	      redirect_to root_url
	    else
	      render 'new'
	    end
    end

    def edit
    end

    def update
        if current_user.update(user_params)
            flash[:success] = 'Dados atualizados com sucesso'
            redirect_to user_contacts_url(current_user)
        else
            render 'edit'
        end
    end

    private
	    def user_params
	      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
	    end
    
end
