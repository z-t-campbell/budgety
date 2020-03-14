class RemoveOrderFromrReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :order_id
  end
end

