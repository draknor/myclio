class DataController < ApplicationController
  before_filter :authenticate_user!

  # GET /data
  # GET /data.json
  def index
    #@data = Datum.all
    @data = current_user.data.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data }
    end
  end

  # GET /data/1
  # GET /data/1.json
  def show
    #@datum = Datum.find(params[:id])
    @datum = current_user.data.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @datum }
    end
  end

  # GET /data/new
  # GET /data/new.json
  def new
    @datum = Datum.new
    @datumTypes = current_user.datumTypes.all
    @formURL = user_data_path(current_user)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @datum }
    end
  end

  # GET /data/1/edit
  def edit
    @datum = current_user.data.find(params[:id])
    @datumTypes = current_user.datumTypes.all
    @formURL = user_datum_path(current_user)

  end

  # POST /data
  # POST /data.json
  def create
    @datum = Datum.new(params[:datum])
    @datum.user_id = current_user.id

    respond_to do |format|
      if @datum.save
        format.html { redirect_to user_datum_path(current_user,@datum), notice: 'Data point was successfully logged.' }
        format.json { render json: @datum, status: :created, location: @datum }
      else
        format.html { render action: "new" }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data/1
  # PUT /data/1.json
  def update
    @datum = current_user.data.find(params[:id])

    respond_to do |format|
      if @datum.update_attributes(params[:datum])
        format.html { redirect_to user_datum_path(current_user,@datum), notice: 'Data point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data/1
  # DELETE /data/1.json
  def destroy
    @datum = current_user.data.find(params[:id])
    @datum.destroy

    respond_to do |format|
      format.html { redirect_to user_data_path(current_user) }
      format.json { head :no_content }
    end
  end
end
