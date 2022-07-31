class CommunicationsController < ApplicationController
  before_action :set_communication, only: %i[ show update destroy ]

  # GET /communications
  # GET /communications.json
  def index
    @communications = Communication.all
  end

  # GET /communications/1
  # GET /communications/1.json
  def show
  end

  # POST /communications
  # POST /communications.json
  def create
    @communication = Communication.new(communication_params)

    if @communication.save
      render :show, status: :created, location: @communication
    else
      render json: @communication.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /communications/1
  # PATCH/PUT /communications/1.json
  def update
    if @communication.update(communication_params)
      render :show, status: :ok, location: @communication
    else
      render json: @communication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /communications/1
  # DELETE /communications/1.json
  def destroy
    @communication.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_communication
      @communication = Communication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def communication_params
      params.require(:communication).permit(:information, :comm_type, :sub_type, :is_primary, :can_message, :can_call, :best_time, :confirmed, :active)
    end
end
