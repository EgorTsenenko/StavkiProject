require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

  driven_by :selenium, using: chrome
  test "login with wrong email" do
    visit home_url
    click_on 'Войти'
    fill_credentials(wrong_email, wrong_password)
    click_on 'commit'
    assert_text 'Wrong credentials'
  end
end