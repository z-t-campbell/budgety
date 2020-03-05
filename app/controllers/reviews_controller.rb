class ReviewsController < ApplicationController
  def show
  end

  def new
    @order = Order.find(params[:order_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @order = Order.find(params[:order_id])
    @review.order = @order
    if review.save
      redirect_to orders_path(@order)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if review.update(review_params)
      redirect_to orders_path(@order)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
