class ProductsController < ApplicationController

  before_action :main_slider, :set_cake_category
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new

   @product = Product.new
   @cake_category = CakeCategory.all.map{|c| [ c.title, c.id ] }
  end

  # GET /products/1/edit
  def edit
    @cake_category = CakeCategory.all.map{|c| [ c.title, c.id ] }
  end

  # POST /products
  # POST /products.json
  def create

    @product = Product.new(product_params)
    @product.cake_category_id = params[:cake_category_id]


    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.cake_category_id = params[:cake_category_id]
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, notice: 'Product was successfully updated.'}
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def who_bought
    @all_orders = Order.all
    #@product = Product.find(params[:id])
    #@latest_order = @product.orders.order(:updated_at).last
      respond_to do |format|
        format.html

    end
  end

  #def all_orders
   # @all_orders = Order.all
    #respond_to do |format|
     # format.html
    #end
  #end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      @cake_categories = CakeCategory.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :ingridients , :price, :product_image, :cake_category)
    end

  def main_slider
    @slides = Slide.all
  end

  def set_cake_category
    @cake_categories = CakeCategory.all
  end
end
