class SignupController < ApplicationController

  def login
  end

  def register
  end

  def information
    @user = User.new
    # redirect_to phonenumber_signup_index_path
  end

  def phonenumber
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    @user = User.new
  end

  def address
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @address = Address.new

  end

  def card
    session[:address_first_name] = address_params[:address_first_name]
    session[:address_last_name] = address_params[:address_last_name]
    session[:address_first_name_kana] = address_params[:address_first_name_kana]
    session[:address_last_name_kana] = address_params[:address_last_name_kana]
    session[:address_last_name_kana] = address_params[:address_last_name_kana]
    session[:apostal_code] = address_params[:postal_code]
    session[:prefecture_id] = address_params[:prefecture_id]
    session[:city] = address_params[:city]
    session[:block] = address_params[:block]
    session[:building] = address_params[:building]
    session[:phone_number] = address_params[:phone_number]
    @address = Address.new
    @user = User.new

  end

  def complete
    @user = User.new

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
      phone_number: session[:phone_number] 
    )

    @address = Address.new (
      address_last_name: session[:address_last_name]
      address_first_name_kana: session[:address_first_name_kana]
      address_last_name_kana: session[:address_last_name_kana]
      address_first_name_kana: session[:address_last_name_kana]
      postal_code: session[:postal_code]
      prefecture_id: session[:prefecture_id]
      city: session[:city]
      block: session[:block]
      building: session[:building]
      phone_number: session[:phone_number]
    )

    if @user.save
    session[:id] = @user.id
    redirect_to complete_signup_index_path
    else
      render '/signup/registration'
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
    )
    end

    def address_params
      params.require(:address).permit(
        :address_first_name, 
        :address_last_name, 
        :address_first_name_kana, 
        :address_last_name_kana, 
        :postal_code, 
        :prefecture_id, 
        :city, 
        :block, 
        :building, 
        :phone_number, 
    )
    end

end
