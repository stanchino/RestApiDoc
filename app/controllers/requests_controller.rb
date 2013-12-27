class RequestsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_page, only: [:index, :new, :create]
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /suites/1/pages/2/requests
  # GET /suites/1/pages/2/requests.json
  def index
    @requests = @page.requests
  end

  # GET /suites/1/pages/2/requests/1
  # GET /suites/1/pages/2/requests/1.json
  def show
  end

  # GET /suites/1/pages/2/requests/new
  def new
    @request = @page.requests.new
  end

  # GET /suites/1/pages/2/requests/1/edit
  def edit
  end

  # POST /suites/1/pages/2/requests
  # POST /suites/1/pages/2/requests.json
  def create
    @request = @page.requests.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @project, notice: 'Request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suites/1/pages/2/requests/1
  # PATCH/PUT /suites/1/pages/2/requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @project, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suites/1/pages/2/requests/1
  # DELETE /suites/1/pages/2/requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.joins(:suite => :users).where("users.id" => current_user.id, "suite_id" => params[:suite_id], :id => params[:page_id]).first
      @suite = @page.suite
      @project = @suite.project
    end

    def set_request
      @request = Request.joins(:page => { :suite => :users}).where("users.id" => current_user.id, "suites.id" => params[:suite_id], "page_id" => params[:page_id], :id => params[:id]).readonly(false).first
      @page = @request.page
      @suite = @page.suite
      @project = @suite.project
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:title, :description, :method, :entity_id, :entity_attributes => [:uri])
    end
end
