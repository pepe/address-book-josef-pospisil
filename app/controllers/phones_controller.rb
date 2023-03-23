class PhonesController < ApplicationController
  layout proc { false if request.xhr? }
  before_action :set_phone, only: %i[ show edit update destroy ]
  before_action :set_person, only: %i[ index new create ]
  before_action :check_session

  # GET /phones or /phones.json
  def index
    @phones = Phone.all
    if request.xhr?
      render partial: "list", locals: { phones: @phones }
    end
  end

  # GET /phones/1 or /phones/1.json
  def show
  end

  # GET /phones/new
  def new
    @phone = Phone.new
  end

  # GET /phones/1/edit
  def edit
    @person = @phone.person
  end

  # POST /phones or /phones.json
  def create
    @phone = Phone.new(phone_params)

    respond_to do |format|
      if @phone.save
        if request.xhr?
          format.html { render inline: "<%= link_to 'New Phone', new_person_phone_path(@person), class: 'new' %>" }
        else
          format.html { redirect_to phone_url(@phone), notice: "Phone was successfully created." }
          format.json { render :show, status: :created, location: @phone }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1 or /phones/1.json
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to phone_url(@phone), notice: "Phone was successfully updated." }
        format.json { render :show, status: :ok, location: @phone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1 or /phones/1.json
  def destroy
    @phone.destroy

    respond_to do |format|
      format.html { redirect_to person_phones_url(@phone.person), notice: "Phone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
      unless @phone.person.user == helpers.current_user
        redirect_to "/logout", notice: "illegal access"
      end
    end

    # Only allow a list of trusted parameters through.
    def phone_params
      params.require(:phone).permit(:number, :comment, :person_id)
    end
end
