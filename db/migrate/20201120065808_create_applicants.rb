class CreateApplicants < ActiveRecord::Migration[6.0]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :screen_name

      t.timestamps
    end
  end
end
