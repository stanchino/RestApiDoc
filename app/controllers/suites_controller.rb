class SuitesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:new, :create]
  before_action :set_suite, only: [:show, :edit, :update, :destroy]

  # GET /suites
  # GET /suites.json
  def index
    if params[:project_id].blank?
      @suites = Suite.includes(:project).joins(:users).where("users.id" => current_user.id)
    else
      @project = current_user.projects.find_by_id(params[:project_id])
      @suites = @project.suites.includes(:project)
    end
  end

  # GET /suites/1
  # GET /suites/1.json
  def show
  end

  # GET /projects/1/suites/new
  def new
    @suite = @project.suites.new
  end

  # GET /suites/1/edit
  def edit
  end

  # POST /suites
  # POST /suites.json
  def create
    data = suite_params.merge(users_suites_attributes: [{user_id: current_user.id, role: "owner"}])
    @suite = @project.suites.build(data)

    respond_to do |format|
      if @suite.save
        format.html { redirect_to @project, notice: 'Suite was successfully created.' }
        format.json { render action: 'show', status: :created, location: @suite }
      else
        format.html { render action: 'new' }
        format.json { render json: @suite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suites/1
  # PATCH/PUT /suites/1.json
  def update
    respond_to do |format|
      if @suite.update(suite_params)
        format.html { redirect_to @project, notice: 'Suite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @suite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suites/1
  # DELETE /suites/1.json
  def destroy
    @suite.destroy
    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suite
      if params[:project_id].blank?
        head :forbidden
      else
        @suite = Suite.joins(project: :users).where("users.id" => current_user.id, "projects.id" => params[:project_id], :id => params[:id]).readonly(false).first
        @project = @suite.project
      end
    end

    def set_project
      if params[:project_id].blank?
        head :forbidden
      else
        @project = current_user.projects.find_by_id(params[:project_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suite_params
      params.require(:suite).permit(:name, :title, :description, :published, :order)
    end
end
