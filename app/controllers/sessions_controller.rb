# This controllder is responsible for: 1. logging users in/out  2. omniauth 
# It can also be a spot for a Welcome Page

# class SessionsController < ApplicationController

#     # this is responsible for processing the login form 
#     def create 
#         # first thing is to find the user in the db 
#         @user = User.find_by_username(params[:username])

#         #want to check that the user exists
#         #then authenticate their password

#         if @user && @user.authenticate(params[:password]) 
#             session[:user_id] = @user.id # to log user in, and keep track of user 
#             render json: user, status: :ok 
#         else
#             render json: "Invalid Credentials. Try again!", status: :unauthorised
#         end 
#     end 

#     def destroy # to log the session out 
#         session.delete :user_id 
#         # redirect_to login_path 
#         render json: {
#             status: 200,
#             logged_out: true
#         }
#     end 


# end

# the session method is going to sign and encrypt user.id, and then set/send a cookie to our browser which is the encrypted version of the session, so it works as a token that keeps track of our user throughout our application. 


  # We are not creating/instantiating an object for a session, just authenticating it, so the def home method, is only rendering the login view 
    
    # def new  
    #     if session[:user_id]
    #         @current_user = User.find(session[:user_id])]
    #         render json: {
    #             logged_in: true,
    #             user: @current_user
    #         }
    #     else 
    #         render json: {
    #             logged_in: false
    #         }
    #     end 
    # end 