require "test_helper"

class AccessScopesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @access_scope = access_scopes(:one)
  end

  test "should get index" do
    get access_scopes_url, as: :json
    assert_response :success
  end

  test "should create access_scope" do
    assert_difference("AccessScope.count") do
      post access_scopes_url, params: { access_scope: { handle: @access_scope.handle } }, as: :json
    end

    assert_response :created
  end

  test "should show access_scope" do
    get access_scope_url(@access_scope), as: :json
    assert_response :success
  end

  test "should update access_scope" do
    patch access_scope_url(@access_scope), params: { access_scope: { handle: @access_scope.handle } }, as: :json
    assert_response :success
  end

  test "should destroy access_scope" do
    assert_difference("AccessScope.count", -1) do
      delete access_scope_url(@access_scope), as: :json
    end

    assert_response :no_content
  end
end
