require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
    @id = @question.id
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get answer" do
    get answer_path(@id)
    assert_response :success
  end

end
