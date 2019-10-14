class SignupController < ApplicationController
  before_action :session_before_phonenumber, only: :phonenumber
  before_action :session_before_address, only: :address
  before_action :session_before_card, only: :card
  before_action :session_before_complete, only: :create

  def index
  end

  def login
  end

  def register    
  end

  def information
    @user = User.new

  end

  def phonenumber
    @user = User.new
    
  end

  def address
    @user = User.new
    @user.build_address
  end

  def card
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      phone_number: session[:phone_number],
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday]
    )
    @user.build_address(session[:address_attributes])
  end

  def complete

  end

  def create
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      phone_number: session[:phone_number],
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      address_attributes: session[:address_attributes]
    )
    @user.build_address(session[:address_attributes])
    @user.save!
    if @user.save
      redirect_to complete_signup_index_path
    else 
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :nickname, 
        :email, 
        :password, 
        :password_confirmation, 
        :last_name, 
        :first_name, 
        :last_name_kana, 
        :first_name_kana, 
        :phone_number,
        :birthyear,
        :birthmonth,
        :birthday,
        address_attributes: [
          :id,
          :address_first_name,
          :address_last_name,
          :address_first_name_kana, 
          :address_last_name_kana,
          :postal_code,
          :prefecture_id,
          :city,
          :block,
          :building,
          :address_phone_number]
    )
    end

    def session_before_phonenumber
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
      session[:last_name] = user_params[:last_name]
      session[:first_name] = user_params[:first_name]
      session[:last_name_kana] = user_params[:last_name_kana]
      session[:first_name_kana] = user_params[:first_name_kana]
      session[:birthyear] = user_params[:birthyear]
      session[:birthmonth] = user_params[:birthmonth]
      session[:birthday] = user_params[:birthday]
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password],
        password_confirmation: session[:password_confirmation],
        last_name: session[:last_name], 
        first_name: session[:first_name], 
        last_name_kana: session[:last_name_kana], 
        first_name_kana: session[:first_name_kana], 
        birthyear: session[:birthyear],
        birthmonth: session[:birthmonth],
        birthday: session[:birthday]
      )
    end
  
    def session_before_address
      session[:phone_number] = user_params[:phone_number]
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password],
        password_confirmation: session[:password_confirmation],
        last_name: session[:last_name], 
        first_name: session[:first_name], 
        last_name_kana: session[:last_name_kana], 
        first_name_kana: session[:first_name_kana], 
        birthyear: session[:birthyear],
        birthmonth: session[:birthmonth],
        birthday: session[:birthday],
        phone_number: session[:phone_number]
      )
    end
  
    def session_before_card
      session[:address_attributes] = user_params[:address_attributes]
      session[:address_first_name] = user_params[:address_attributes][:address_first_name]
      session[:address_last_name] = user_params[:address_attributes][:address_last_name]
      session[:address_first_name_kana] = user_params[:address_attributes][:address_first_name_kana]
      session[:address_last_name_kana] = user_params[:address_attributes][:address_last_name_kana]
      session[:postal_code] = user_params[:address_attributes][:postal_code]
      session[:prefecture_id] = user_params[:address_attributes][:prefecture_id]
      session[:city] = user_params[:address_attributes][:city]
      session[:block] = user_params[:address_attributes][:block]
      session[:building] = user_params[:address_attributes][:building]
      session[:address_phone_number] = user_params[:address_attributes][:address_phone_number]
      @user = User.new(
        nickname: session[:nickname], 
        email: session[:email],
        password: session[:password],
        password_confirmation: session[:password_confirmation],
        last_name: session[:last_name], 
        first_name: session[:first_name], 
        last_name_kana: session[:last_name_kana], 
        first_name_kana: session[:first_name_kana], 
        phone_number: session[:phone_number],
        birthyear: session[:birthyear],
        birthmonth: session[:birthmonth],
        birthday: session[:birthday]
      )
      @user.build_address
    end
  
    def session_before_complete
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password],
        password_confirmation: session[:password_confirmation],
        last_name: session[:last_name], 
        first_name: session[:first_name], 
        last_name_kana: session[:last_name_kana], 
        first_name_kana: session[:first_name_kana], 
        birthyear: session[:birthyear],
        birthmonth: session[:birthmonth],
        birthday: session[:birthday],
        phone_number: session[:phone_number],
      )
      @user.build_address(session[:address_attributes])
    end
end
