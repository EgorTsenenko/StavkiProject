require_relative '../test_helper'

class UserTest < ActiveSupport::TestCase
  include UserHelper

  test 'should not create user without email' do
    user = User.new
    user.save
    assert_includes user.errors.full_message, "Email can't be blank"
  end
  test 'should not create user with duplicate name' do
    author = users :author
    clone = User.new email: author.email,password: correct_password,
                     password_confirmation: correct_password
    clone.save
    assert_equal 'Email has already been taken',
                 clone.errors.full_messages[0]
  end
end