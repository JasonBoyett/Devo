require "test_helper"

class ImpressionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @impression = impressions(:one)
  end

  test "should get index" do
    get impressions_url, as: :json
    assert_response :success
  end

  test "should create impression" do
    assert_difference("Impression.count") do
      post impressions_url, params: { impression: { devotional_id: @impression.devotional_id, emoji: @impression.emoji } }, as: :json
    end

    assert_response :created
  end

  test "should show impression" do
    get impression_url(@impression), as: :json
    assert_response :success
  end

  test "should update impression" do
    patch impression_url(@impression), params: { impression: { devotional_id: @impression.devotional_id, emoji: @impression.emoji } }, as: :json
    assert_response :success
  end

  test "should destroy impression" do
    assert_difference("Impression.count", -1) do
      delete impression_url(@impression), as: :json
    end

    assert_response :no_content
  end
end
