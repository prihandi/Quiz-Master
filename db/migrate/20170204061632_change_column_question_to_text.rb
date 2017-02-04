class ChangeColumnQuestionToText < ActiveRecord::Migration[5.0]
  def up
    change_column :questions, :question, :text
  end
  def down
      change_column :questions, :question, :string
  end
end
