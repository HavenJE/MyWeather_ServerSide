class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    skip_before_action :authorized, only: [:create]

    def index
        @users = User.all
        render json: @users, each_serializer: UserSerializer
    end 
    
    def new
        @user = User.new 
    end 
    
    def show
        if current_user # we used current_user as we already used method in our application_controller
        render json: current_user, status: :ok
        else 
            render json: "Not authenticated", status: :unauthorised
        end 
    end 

    def create # to processing a sign up form 
        @user = User.create(user_params)
        if @user.save 
            token = encode_token({ user_id: @user.id })
            session[:user_id] = user.id # to logs the user in 
            render json: {user: @user, jwt: token }, status: :created, location: @user
            # render json: user, status: created # serialize that user 
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity 
        end 
    end 

    # PATCH/PUT /locations/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

    def destroy
        @user = User.find_by(id: params[:id])
        if @user
            @user.destroy
            # head :no_content
        else 
            render json: "User does not exit", status: 
            :not_found
        end 
    end 

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end 
end
