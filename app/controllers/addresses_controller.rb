class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :set_person, only: %i[ index new create ]
  before_action :check_session

  # GET /addresses or /addresses.json
  def index
    @addresses = @person.addresses
  end

  # GET /addresses/1 or /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
    @person = @address.person
  end

  # POST /addresses or /addresses.json
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to address_url(@address), notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to address_url(@address), notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @address.destroy

    respond_to do |format|
      format.html { redirect_to person_addresses_url(@address.person), notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private    
    def set_address
      @address = Address.find(params[:id])
      unless @address.person.user == helpers.current_user
        redirect_to "/logout", notice: "illegal access"
      end
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:street, :town, :zip, :state, :country, :person_id)
    end
end
