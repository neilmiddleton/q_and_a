class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    enable_extension "pgcrypto"

    create_table :questions, id: :uuid do |t|
      t.uuid :user_id, index: true
      t.text :text
      t.integer :answers_count, default: 0
      t.timestamps
    end
  end
end
