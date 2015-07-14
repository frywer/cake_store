class StuffingCakesController < ApplicationController
  before_action :set_stuffing_cake,  only: [ :show, :edit, :update, :destroy]
  before_action :set_cake_category, :main_slider
  skip_before_action :authorize, only: [:index]


  # GET /stuffing_cakes
  # GET /stuffing_cakes.json
  def index
    @stuffing_cakes = StuffingCake.all
  end

  # GET /stuffing_cakes/1
  # GET /stuffing_cakes/1.json
  def show
  end

  # GET /stuffing_cakes/new
  def new
    @stuffing_cake = StuffingCake.new
  end

  # GET /stuffing_cakes/1/edit
  def edit
  end

  # POST /stuffing_cakes
  # POST /stuffing_cakes.json
  def create
    @stuffing_cake = StuffingCake.new(stuffing_cake_params)

    respond_to do |format|
      if @stuffing_cake.save
        format.html { redirect_to @stuffing_cake, notice: 'Stuffing cake was successfully created.' }
        format.json { render :show, status: :created, location: @stuffing_cake }
      else
        format.html { render :new }
        format.json { render json: @stuffing_cake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stuffing_cakes/1
  # PATCH/PUT /stuffing_cakes/1.json
  def update
    respond_to do |format|
      if @stuffing_cake.update(stuffing_cake_params)
        format.html { redirect_to @stuffing_cake, notice: 'Stuffing cake was successfully updated.' }
        format.json { render :show, status: :ok, location: @stuffing_cake }
      else
        format.html { render :edit }
        format.json { render json: @stuffing_cake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stuffing_cakes/1
  # DELETE /stuffing_cakes/1.json
  def destroy
    @stuffing_cake.destroy
    respond_to do |format|
      format.html { redirect_to stuffing_cakes_url, notice: 'Stuffing cake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stuffing_cake
      @stuffing_cake = StuffingCake.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stuffing_cake_params
      params.require(:stuffing_cake).permit(:image, :description, :price)
    end

  def main_slider
    @slides = Slide.all
  end

  def set_cake_category
    @cake_categories = CakeCategory.all
  end


end
