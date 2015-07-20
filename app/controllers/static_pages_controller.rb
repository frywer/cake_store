class StaticPagesController < ApplicationController
  skip_before_action :authorize

  before_action :set_config
  def contacts
    @page = Page.find_by_title('contacts')
  end

  def prices
    @page = Page.find_by_title('prices')
  end

  def about
    @page = Page.find_by_title('about')
  end
end


private

def set_config
  @cake_categories = CakeCategory.all
  @slides = Slide.all
  @categories = Category.all
end