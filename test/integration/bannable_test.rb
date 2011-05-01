require 'test_helper'

class BannableTest < ActionController::IntegrationTest

  test 'banned user should not be able to sign in' do
    us = sign_in_as_user(:banned => true)
    assert_not warden.authenticated?(:user)
  end
  
  test 'unbanned user should be able to sign in' do
    us = sign_in_as_user(:banned => false)
    assert warden.authenticated?(:user)
  end

end
