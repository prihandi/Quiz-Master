class AddSubmittedAnswerToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :submitted_answer, :string
  end
end
