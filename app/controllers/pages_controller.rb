class PagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_suite, only: [:new, :create]
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /suites/1/pages
  # GET /suites/1/pages.json
  def index
    @suite = Suite.joins(:users).where("users.id" => current_user.id, :id => params[:suite_id]).first
    @project = @suite.project
    @pages = @suite.pages
  end

  # GET /suites/1/pages/1
  # GET /suites/1/pages/1.json
  def show
  end

  # GET /suites/1/pages/new
  def new
    @page = @suite.pages.new
  end

  # GET /suites/1/pages/1/edit
  def edit
  end

  # POST /suites/1/pages
  # POST /suites/1/pages.json
  def create
    @page = @suite.pages.build(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @project, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @roject }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suites/1/pages/1
  # PATCH/PUT /suites/1/pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @project, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suites/1/pages/1
  # DELETE /suites/1/pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suite
      @suite = Suite.joins(:users).where("users.id" => current_user.id, :id => params[:suite_id]).first
      @project = @suite.project
    end

    def set_page
      @page = Page.joins(suite: :users).where("users.id" => current_user.id, "suites.id" => params[:suite_id], :id => params[:id]).readonly(false).first
      @suite = @page.suite
      @project = @suite.project
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :title, :description, :published, :order)
    end
end
