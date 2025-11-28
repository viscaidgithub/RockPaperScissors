class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :user_choice
      t.string :computer_choice
      t.string :result

      t.timestamps
    end
  end
end
