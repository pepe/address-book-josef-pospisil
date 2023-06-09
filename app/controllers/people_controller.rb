class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]
  before_action :check_session

  # GET /people or /people.json
  def index
    @people = helpers.current_user.people
  end

  # GET /people/1 or /people/1.json
  def show
    @person = Person.find(params[:id])
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)
    @person.user = helpers.current_user
    respond_to do |format|
      if @person.save
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    if @person.user == helpers.current_user
      respond_to do |format|
        if @person.update(person_params)
          format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
          format.json { render :show, status: :ok, location: @person }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @person.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to "/logout", notice: "ilegal access"
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    if @person.user == helpers.current_user
      @person.destroy

      respond_to do |format|
        format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to "/logout", notice: "ilegal access"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date, :comment)
    end
end
