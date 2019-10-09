class SignupController < ApplicationController

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
    @address = Address.new

  end

  def card
    @user = User.new
  end

  def complete
  end

end
