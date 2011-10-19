class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  
  before_filter :load_tracker
  
  def index
    @projects = @tracker.projects
    @pivo_projects = @tracker.all_projects_from_pivotal

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = @tracker.projects.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.tracker_id = @tracker.id

    respond_to do |format|
      if @project.save
        format.html { redirect_to tracker_project_path(params[:tracker_id], @project.id), notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to tracker_project_path(params[:tracker_id], @project.id), notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to tracker_projects_path(params[:tracker_id]) }
      format.json { head :ok }
    end
  end
  
  def ical
      TrackerIcal.token = @tracker.pivotal_token
      @ical = TrackerIcal.create_calendar_for_project_id(Project.find(params[:id]).project_id)

      respond_to do |format|
        format.ics {render :text => @ical}
        format.json {render :json => @ical}
      end
  end
  
  private
  
  def load_tracker
    @tracker = Tracker.find(params[:tracker_id])
  end
end
