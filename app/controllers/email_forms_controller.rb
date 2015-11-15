class EmailFormsController < ApplicationController
  before_action :set_email_form, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:create]
  before_action :main_slider

  # GET /email_forms
  # GET /email_forms.json
  def index
    @email_forms = EmailForm.all
    @email_form = EmailForm.new
  end

  # GET /email_forms/1
  # GET /email_forms/1.json
  def show
  end

  # GET /email_forms/new
  def new
    @email_form = EmailForm.new
  end

  # GET /email_forms/1/edit
  def edit
  end

  # POST /email_forms
  # POST /email_forms.json
  def create
    @email_form = EmailForm.new(email_form_params)

    respond_to do |format|
      if verify_recaptcha( model: @email_form, message: "Вы не прошли проверку :( Если вы не робот, пожалуйста, попробуйте еще раз.  Please try again") && @email_form.save
        #UserNotifier.user_notifier(@email_form).deliver_now
        format.html { redirect_to "/store/index", notice: 'Спасибо за ваше письмо, мы скоро с вами свяжемся.' }
        format.json { render :show, status: :created, location: @email_form }
      else
        format.html { render "store/index"  }
        format.json { render json: @email_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_forms/1
  # PATCH/PUT /email_forms/1.json
  def update
    respond_to do |format|
      if @email_form.update(email_form_params)
        format.html { redirect_to @email_form, notice: 'Email form was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_form }
      else
        format.html { render :edit }
        format.json { render json: @email_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_forms/1
  # DELETE /email_forms/1.json
  def destroy
    @email_form.destroy
    respond_to do |format|
      format.html { redirect_to email_forms_url, notice: 'Email form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_form
      @email_form = EmailForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_form_params
      params.require(:email_form).permit(:name, :email, :phone, :subject, :message)
    end

  def main_slider
    @slides = Slide.all
    @cake_categories = CakeCategory.all
    @categories = Category.all

    @tweets = Tweet.all
    @email_forms = EmailForm.all
    @email_form = EmailForm.new

  end
end
