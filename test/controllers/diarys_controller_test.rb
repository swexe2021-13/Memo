require 'test_helper'

class DiarysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diarys_index_url
    assert_response :success
  end

end
