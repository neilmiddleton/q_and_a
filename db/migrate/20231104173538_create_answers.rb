class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers, id: :uuid do |t|
      t.uuid :user_id, index: true
      t.uuid :question_id, index: true
      t.text :text
      t.timestamps
    end
  end
end
