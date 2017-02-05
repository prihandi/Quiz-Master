require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  def setup
  @question = Question.new(question: "Example User", answer: "1", submitted_answer: "")
  end

  test "should be valid" do
    assert @question.valid?
  end

  test "question should be present" do
    @question.question = " "
    assert_not @question.valid?
  end

  test "question should more than 3 character" do
    @question.question = "aa"
    assert_not @question.valid?
  end

  test "question should valid with 3 character" do
    @question.question = "aas"
    assert @question.valid?
  end

  test "answer should be present" do
    @question.answer = " "
    assert_not @question.valid?
  end

  test "empty submitted answer would not correct" do
    assert_not @question.is_correct?
  end

  test "space only submitted answer would not correct" do
    @question.submitted_answer = "    "
    assert_not @question.is_correct?
  end

  test "correct submitted answer would be correct" do
    @question.submitted_answer = "1"
    assert @question.is_correct?
  end

  test "correct submitted answer in words would be correct" do
    @question.submitted_answer = "one"
    assert @question.is_correct?
  end

  test "correct submitted answer in words with extra points/dots would be correct" do
    @question.submitted_answer = "one.."
    assert @question.is_correct?
  end

  test "correct submitted answer in words with extra spaces would be correct" do
    @question.submitted_answer = "  one    "
    assert @question.is_correct?
  end

  test "correct submitted answer in float number would be correct" do
    @question.submitted_answer = "1.00"
    assert @question.is_correct?
  end

  test "answer in number and words would be match" do
    @question.answer = "1 car"
    @question.submitted_answer = "one car"
    assert @question.is_correct?
  end  

  test "answer in float number and words would be match" do
    @question.answer = "1.98 inch"
    @question.submitted_answer = "one point nine eight inch"
    assert @question.is_correct?
  end 

  test "answer in number between 20 and 100 with extra spaces would be match" do
    @question.answer = "44"
    @question.submitted_answer = "forty four. "
    assert @question.is_correct?
  end 

  test "answer in number more than 1000 would be match" do
    @question.answer = "1228.88"
    @question.submitted_answer = "one thousand two hundreds and twenty eight point eight eight. "
    assert @question.is_correct?
  end
end
