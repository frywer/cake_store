class CakeCategoriesController < ApplicationController
  before_action :set_cake_category, only: [:show, :edit, :update, :destroy]
  before_action :set_slide
  skip_before_action :authorize, only: [:show, :index]


  # GET /cake_categories
  # GET /cake_categories.json
  def index
    @cake_categories = CakeCategory.all

  end

  # GET /cake_categories/1
  # GET /cake_categories/1.json
  def show

   # @products = Product.all
  end

  # GET /cake_categories/new
  def new
    @category = Category.all
    @cake_categories = CakeCategory.all
    @cake_category = CakeCategory.new
  end

  # GET /cake_categories/1/edit
  def edit
    @category = Category.all
  end

  # POST /cake_categories
  # POST /cake_categories.json
  def create
    @category = Category.all
    @cake_category = CakeCategory.new(cake_category_params)
    #@cake_category.category_id = params[:category_id]

    respond_to do |format|
      if @cake_category.save
        format.html { redirect_to categories_url, notice: 'Cake category was successfully created.' }
        format.json { render :show, status: :created, location: @cake_category }
      else
        format.html { render :new }
        format.json { render json: @cake_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cake_categories/1
  # PATCH/PUT /cake_categories/1.json
  def update
    @cake_category.category_id = params[:category_id]
    respond_to do |format|
      if @cake_category.update(cake_category_params)
        format.html { redirect_to categories_url, notice: 'Cake category was successfully updated.' }
        format.json { render :show, status: :ok, location: @cake_category }
      else
        format.html { render :edit }
        format.json { render json: @cake_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cake_categories/1
  # DELETE /cake_categories/1.json
  def destroy
    @cake_category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Cake category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cake_category
      @cake_categories = CakeCategory.all
      @cake_category = CakeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cake_category_params
      params.require(:cake_category).permit(:title, :category_id)
    end

   def set_slide
     @slides = Slide.all
     @categories = Category.all
   end
end
