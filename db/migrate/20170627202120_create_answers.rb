class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.reference :question
      t.text :body

      t.timestamps null: false
    end
  end
end
