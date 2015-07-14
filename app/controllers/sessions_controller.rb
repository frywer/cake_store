class SessionsController < ApplicationController
  skip_before_action :authorize
  before_action :main_slider, :set_cake_category

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Неверная комбинация имени и пароля"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "Сеанс работы завершен"
  end
  private

  def main_slider
    @slides = Slide.all
  end


  def set_cake_category
    @cake_categories = CakeCategory.all
  end

end
