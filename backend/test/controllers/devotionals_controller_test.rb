require 'test_helper'

class DevotionalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @devotional = devotionals(:one)
  end

  test 'should get index' do
    get devotionals_url, as: :json
    assert_response :success
  end

  test 'should create devotional' do
    assert_difference('Devotional.count') do
      post devotionals_url,
           params: { devotional: { body: @devotional.body, is_markdown: @devotional.is_markdown, is_publuic: @devotional.is_publuic, scriptures: @devotional.scriptures, template: @devotional.template, title: @devotional.title, user_id: @devotional.user_id } }, as: :json
    end

    assert_response :created
  end

  test 'should show devotional' do
    get devotional_url(@devotional), as: :json
    assert_response :success
  end

  test 'should update devotional' do
    patch devotional_url(@devotional),
          params: { devotional: { body: @devotional.body, is_markdown: @devotional.is_markdown, is_publuic: @devotional.is_publuic, scriptures: @devotional.scriptures, template: @devotional.template, title: @devotional.title, user_id: @devotional.user_id } }, as: :json
    assert_response :success
  end

  test 'should destroy devotional' do
    assert_difference('Devotional.count', -1) do
      delete devotional_url(@devotional), as: :json
    end

    assert_response :no_content
  end
end
