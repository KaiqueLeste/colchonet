class UsersController < ApplicationController
	
	#Editar Usuario
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user,
				notice: 'Cadastro atualizado com sucesso!'
		else
			render action: :edit
		end
	end

	#Mostrar Usuario
	def show
		@user = User.find(params[:id])
	end
	
	#Cria Usuario
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user,
				notice: 'Cadastro criado com sucesso!'
		else
			render action: :new
		end
	end

	private

	def user_params
		params.
			require(:user).
			permit(:email, :full_name, :location, :password,
		       	       :password_confirmation, :bio)
	end
end
