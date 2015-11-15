class AdminController < ApplicationController
  def index
    @total_orders = Order.count
      @slides = Slide.all
    @cake_categories = CakeCategory.all
    @categories = Category.all
    @email_form = EmailForm.new
    @tweets = Tweet.all
  end
end
