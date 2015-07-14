class AdminController < ApplicationController
  def index
    @total_orders = Order.count
      @slides = Slide.all
    @cake_categories = CakeCategory.all
  end
end
