require "test_helper"

class CommunicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @communication = communications(:one)
  end

  test "should get index" do
    get communications_url, as: :json
    assert_response :success
  end

  test "should create communication" do
    assert_difference("Communication.count") do
      post communications_url, params: { communication: { active: @communication.active, best_time: @communication.best_time, can_call: @communication.can_call, can_message: @communication.can_message, comm_type: @communication.comm_type, confirmed: @communication.confirmed, information: @communication.information, is_primary: @communication.is_primary, sub_type: @communication.sub_type } }, as: :json
    end

    assert_response :created
  end

  test "should show communication" do
    get communication_url(@communication), as: :json
    assert_response :success
  end

  test "should update communication" do
    patch communication_url(@communication), params: { communication: { active: @communication.active, best_time: @communication.best_time, can_call: @communication.can_call, can_message: @communication.can_message, comm_type: @communication.comm_type, confirmed: @communication.confirmed, information: @communication.information, is_primary: @communication.is_primary, sub_type: @communication.sub_type } }, as: :json
    assert_response :success
  end

  test "should destroy communication" do
    assert_difference("Communication.count", -1) do
      delete communication_url(@communication), as: :json
    end

    assert_response :no_content
  end
end
