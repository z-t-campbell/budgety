class AddRatingToOrganisation < ActiveRecord::Migration[5.2]
  def change
    add_column :organisations, :rating, :integer
  end
end
