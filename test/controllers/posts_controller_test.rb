require_relative "../test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should render posts' do
    get posts_url
    assert_response :success
  end
end
