class TrackersController < ApplicationController
  # GET /trackers
  # GET /trackers.json
  def index
    @trackers = Tracker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trackers }
    end
  end

  # GET /trackers/1
  # GET /trackers/1.json
  def show
    @tracker = Tracker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tracker }
    end
  end

  # GET /trackers/new
  # GET /trackers/new.json
  def new
    @tracker = Tracker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tracker }
    end
  end

  # GET /trackers/1/edit
  def edit
    @tracker = Tracker.find(params[:id])
  end

  # POST /trackers
  # POST /trackers.json
  def create
    @tracker = Tracker.new(params[:tracker])

    respond_to do |format|
      if @tracker.save
        format.html { redirect_to @tracker, notice: 'Tracker was successfully created.' }
        format.json { render json: @tracker, status: :created, location: @tracker }
      else
        format.html { render action: "new" }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trackers/1
  # PUT /trackers/1.json
  def update
    @tracker = Tracker.find(params[:id])

    respond_to do |format|
      if @tracker.update_attributes(params[:tracker])
        format.html { redirect_to @tracker, notice: 'Tracker was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackers/1
  # DELETE /trackers/1.json
  def destroy
    @tracker = Tracker.find(params[:id])
    @tracker.destroy

    respond_to do |format|
      format.html { redirect_to trackers_url }
      format.json { head :ok }
    end
  end
end
