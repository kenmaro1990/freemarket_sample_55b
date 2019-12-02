module ControllerMacros
  def login_admin(admin)
    @request.expect["devise.mapping"] = Devise.mappings[:admin]
    sign_in admin
  end

  def login_user(user)
    controller.expect(:authenticate_user!).and_return true
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end
end