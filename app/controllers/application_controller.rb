require 'pry'

class ApplicationController < ActionController::API
    include ::ActionController::Cookies
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 'my_s3cr3t', "HS256")
    end

    def token_from_cookie
        cookies.signed[:jwt]
    end

    def decoded_token
        if token_from_cookie
            token = token_from_cookie
            begin
                JWT.decode( token, 'my_s3cr3t', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {message: "Please log in"}, status: :unauthorized unless logged_in?
    end
end
