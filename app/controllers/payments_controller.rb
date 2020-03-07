class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'Booking Confirmed').find(params[:order_id])
  end
end
