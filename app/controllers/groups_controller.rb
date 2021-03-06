class GroupsController < ApplicationController
  before_filter :authenticate_user!
  around_filter :user_time_zone, :if => :current_user

  # GET /groups
  # GET /groups.json
  def index
    @user = current_user
    @groups = current_user.userGroups

    respond_to do |format|
      format.html # index.html.slim
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  # def show
  #   @user = current_user
  #   @group = current_user.groups.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @group }
  #   end
  # end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @user = current_user
    @group = current_user.groups.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])
    @group.user_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to user_groups_path(current_user), notice: "#{@group.name} was successfully created." }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to user_groups_path(current_user), notice: "#{@group.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to user_groups_path(current_user) }
      format.json { head :no_content }
    end
  end
end
