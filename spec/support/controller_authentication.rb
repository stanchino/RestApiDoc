module ControllerAuthentication
  def login_user(user_type = :user)
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(user_type)
      user.save!
      sign_in user
    end
  end

#  def login_admin
#    login_user(:admin)
#  end

#  def login_super_admin
#    login_user(:super_admin)
#  end
end

