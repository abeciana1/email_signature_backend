require 'pry'

class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all
        render :json => users, each_serializer: UserSerializer
    end

    def show
        user = User.find(params[:id])
        render :json => user, each_serializer: UserSerializer
    end
    
    def profile
        # binding.pry
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
        params.permit(:first_name, :last_name, :job_title, :department, :company_name, :office_phone, :mobile_phone, :website_url, :email, :address_1, :address_2, :address_3, :address_4, :linkedin, :twitter, :github, :bonus_field)
    end

end
