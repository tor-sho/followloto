class CreateFinalApplicants < ActiveRecord::Migration[6.0]
  def change
    create_table :final_applicants do |t|
      t.integer :number
      t.string :name
      t.string :screen_name

      t.timestamps
    end
  end
end
