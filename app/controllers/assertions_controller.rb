class AssertionsController < ApplicationController
  before_action :set_assertion, only: [:show, :edit, :update, :destroy]

  # GET /assertions
  # GET /assertions.json
  def index
    @assertions = Assertion.all
  end

  # GET /assertions/1
  # GET /assertions/1.json
  def show
  end

  # GET /assertions/new
  def new
    @assertion = Assertion.new
  end

  # GET /assertions/1/edit
  def edit
  end

  # POST /assertions
  # POST /assertions.json
  def create
    @assertion = Assertion.new(assertion_params)

    respond_to do |format|
      if @assertion.save
        format.html { redirect_to @assertion, notice: 'Assertion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @assertion }
      else
        format.html { render action: 'new' }
        format.json { render json: @assertion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assertions/1
  # PATCH/PUT /assertions/1.json
  def update
    respond_to do |format|
      if @assertion.update(assertion_params)
        format.html { redirect_to @assertion, notice: 'Assertion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @assertion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assertions/1
  # DELETE /assertions/1.json
  def destroy
    @assertion.destroy
    respond_to do |format|
      format.html { redirect_to assertions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assertion
      @assertion = Assertion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assertion_params
      params.require(:assertion).permit(:title, :description, :assignment, :expectation, :code)
    end
end
