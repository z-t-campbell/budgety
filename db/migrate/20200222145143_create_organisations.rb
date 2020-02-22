class CreateOrganisations < ActiveRecord::Migration[5.2]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
