class DatumTypesController < ApplicationController
  before_filter :authenticate_user!
  around_filter :user_time_zone, :if => :current_user

  # GET /datum_types
  # GET /datum_types.json
  def index
    @user = current_user
    @datum_types = current_user.datumTypes.all
    @groups = current_user.userGroups

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @datum_types }
    end
  end

  # GET /datum_types/1
  # GET /datum_types/1.json
  # def show
  #   @user = current_user
  #   @datum_type = current_user.datumTypes.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @datum_type }
  #   end
  # end

  # GET /datum_types/new
  # GET /datum_types/new.json
  def new
    @datum_type = DatumType.new
    @groups = current_user.userGroups

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @datum_type }
    end
  end

  # GET /datum_types/1/edit
  def edit
    @user = current_user
    @datum_type = current_user.datumTypes.find(params[:id])
    @groups = current_user.userGroups
  end

  # POST /datum_types
  # POST /datum_types.json
  def create
    @datum_type = DatumType.new(params[:datum_type])
    @datum_type.user_id = current_user.id

    respond_to do |format|
      if @datum_type.save
        format.html { redirect_to user_datum_types_path(current_user), notice: "#{@datum_type.description} was successfully created." }
        format.json { render json: @datum_type, status: :created, location: @datum_type }
      else
        format.html { render action: "new" }
        format.json { render json: @datum_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /datum_types/1
  # PUT /datum_types/1.json
  def update
    @datum_type = DatumType.find(params[:id])

    respond_to do |format|
      if @datum_type.update_attributes(params[:datum_type])
        format.html { redirect_to user_datum_types_path(current_user), notice: "#{@datum_type.description} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @datum_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datum_types/1
  # DELETE /datum_types/1.json
  def destroy
    @datum_type = DatumType.find(params[:id])
    @datum_type.destroy

    respond_to do |format|
      format.html { redirect_to user_datum_types_path(current_user) }
      format.json { head :no_content }
    end
  end
end
