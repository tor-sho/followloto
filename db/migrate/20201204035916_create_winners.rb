class CreateWinners < ActiveRecord::Migration[6.0]
  def change
    create_table :winners do |t|
      t.integer :number
      t.string :name
      t.string :screen_name

      t.timestamps
    end
  end
end
