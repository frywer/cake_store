class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title).page(params[:page]).per_page(12)
    @cake_categories = CakeCategory.all
    @slides = Slide.all
      @categories = Category.all
  end



end
