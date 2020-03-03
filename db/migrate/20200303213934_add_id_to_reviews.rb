class AddIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :order_id
  end
end
