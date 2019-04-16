class JointsController < ApplicationController
  before_action :set_joint, only: [:show, :edit, :update, :destroy]

  # GET /joints
  # GET /joints.json
  def index
    @joints = Joint.all
  end

  # GET /joints/1
  # GET /joints/1.json
  def show
  end

  # GET /joints/new
  def new
    @joint = Joint.new
  end

  # GET /joints/1/edit
  def edit
  end

  # POST /joints
  # POST /joints.json
  def create
    @joint = Joint.new(joint_params)

    respond_to do |format|
      if @joint.save
        format.html { redirect_to @joint, notice: 'Joint was successfully created.' }
        format.json { render :show, status: :created, location: @joint }
      else
        format.html { render :new }
        format.json { render json: @joint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /joints/1
  # PATCH/PUT /joints/1.json
  def update
    respond_to do |format|
      if @joint.update(joint_params)
        format.html { redirect_to @joint, notice: 'Joint was successfully updated.' }
        format.json { render :show, status: :ok, location: @joint }
      else
        format.html { render :edit }
        format.json { render json: @joint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joints/1
  # DELETE /joints/1.json
  def destroy
    @joint.destroy
    respond_to do |format|
      format.html { redirect_to joints_url, notice: 'Joint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joint
      @joint = Joint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joint_params
      params.require(:joint).permit(:outfit_id, :item_id)
    end
end
