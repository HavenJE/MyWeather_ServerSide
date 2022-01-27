class ApplicationController < ActionController::API

    before_action :authorized # before any of the below methods being invoked, 
  
    def encode_token(payload)
      # should store secret in env variable
      JWT.encode(payload, Rails.application.credentials.secret_key_base) # payload is the info we want to encode 
    end
  
    def auth_header
      # { Authorization: 'Bearer ' }
      request.headers['Authorization'] # comes from the headers key from the configuration object when doing a fetch request    
    end
  
    def decoded_token
      if auth_header # if there is an authorization with a value 'Bearer', then perform line 17
        token = auth_header.split(' ')[1] # specifiying that we want to get the 2ed value => token 
        # header: { 'Authorization': 'Bearer token' }
        begin # this is a rescue if we return an error 
          JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    def current_user
      if decoded_token # if this return the value of line 20 (if there is a decoded token)? then => 
        user_id = decoded_token[0]['user_id'] # will grap the user_id of the logged in user 
        @user = User.find_by(id: user_id) # if there is a user, it will be returned 
      end
    end
  
    def logged_in?
      # The double negate operator !! => returns the opposite of the truthy value 
      !!current_user # if there is a user, it will return the instance, if not, return null 
    end
  
    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

    
end

# At line 7 and 20, payload = is the information that we want to encode 
# and, Rails.application.credentials.secret_key_base = is the salt or the secret key that we want to use to encode. 
# At line 12, the request that comes from the frontend http request comes with the header key configuration object ['Authorization']



# Rails rules of communicating with routes is CSRF token to check that if a user typing into a rails form is an authentic one, not a hijacker 


# # the line below gives access to cookies to all of the childern controllers of ActionController
# include ActionController::Cookies 

# rescue_from ActiveRecord::RecordNotFound, with: :RecordNotFound
# rescue_from ActiveRecord::RecordInvalid, with: :Invalid_record

# private 

# def current_user
#     User.find_by(id: session[:user_id]) # this will return the user who signed in 
# end 

# def current_user
#     # if @user has a value => return it, 
#     # if it does not => set it equal to User.find_by(id: session[:user_id])
#     # this is to inhibit mulitiple call to our db everytime the current_user is invoked 
#     @user ||= User.find_by(id: session[:user_id]) # this will return the user who signed in 
# end

# def record_not_found(errors)
#     render json: errors.message, status: :not_found
# end 

# def invalid_record(invalid)
#     render json: invalid.record.errors, status: :unprocessable_entity
# end 