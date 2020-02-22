class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :location
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :venue_name
      t.references :user, foreign_key: true
      t.references :organisation, foreign_key: true

      t.timestamps
    end
  end
end
