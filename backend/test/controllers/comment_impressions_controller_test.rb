require "test_helper"

class CommentImpressionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_impression = comment_impressions(:one)
  end

  test "should get index" do
    get comment_impressions_url, as: :json
    assert_response :success
  end

  test "should create comment_impression" do
    assert_difference("CommentImpression.count") do
      post comment_impressions_url, params: { comment_impression: { comment_id: @comment_impression.comment_id, emoji: @comment_impression.emoji, user_id: @comment_impression.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show comment_impression" do
    get comment_impression_url(@comment_impression), as: :json
    assert_response :success
  end

  test "should update comment_impression" do
    patch comment_impression_url(@comment_impression), params: { comment_impression: { comment_id: @comment_impression.comment_id, emoji: @comment_impression.emoji, user_id: @comment_impression.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy comment_impression" do
    assert_difference("CommentImpression.count", -1) do
      delete comment_impression_url(@comment_impression), as: :json
    end

    assert_response :no_content
  end
end
