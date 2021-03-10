require 'pry'
require 'json'

class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :session_renew]

    def index
        users = User.all
        render :json => users, each_serializer: UserSerializer
    end

    # def show
    #     user = User.find(params[:id])
    #     render :json => user, each_serializer: UserSerializer
    # end
    
    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def session_renew
        # binding.pry
        user_id = current_user[:id]
        token = encode_token({ user_id: user_id })
        cookies.signed[:jwt] = {value: token, httponly: true,   expires: 1.hour.from_now}
        # current_user
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            # render json: { user: UserSerializer.new(user) }, status: :created
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end
    
    def update
        user = User.find(params[:id])
        user.update(user_params)
        render :json => user, each_serializer: UserSerializer
    end
    
    def delete
        user = User.find(params[:id])
        user.destroy
        render json: {}
    end
    
    private
    
    def user_params
        params.permit(:first_name, :last_name, :job_title, :email, :password)
    end

end


#! "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.g0U5SAOLozk3dz0mNUrvBSR-0CSewJ5eParRWg_abVk"

#! "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.g0U5SAOLozk3dz0mNUrvBSR-0CSewJ5eParRWg_abVk"
