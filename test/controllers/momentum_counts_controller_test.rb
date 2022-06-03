require 'test_helper'

class MomentumCountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get momentum_counts_index_url
    assert_response :success
  end

end
