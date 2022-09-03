class AccessScopesController < ApplicationController
  before_action :set_access_scope, only: %i[ show update destroy ]

  # GET /access_scopes
  # GET /access_scopes.json
  def index
    @access_scopes = AccessScope.all
  end

  # GET /access_scopes/1
  # GET /access_scopes/1.json
  def show
  end

  # POST /access_scopes
  # POST /access_scopes.json
  def create
    @access_scope = AccessScope.new(access_scope_params)

    if @access_scope.save
      render :show, status: :created, location: @access_scope
    else
      render json: @access_scope.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /access_scopes/1
  # PATCH/PUT /access_scopes/1.json
  def update
    if @access_scope.update(access_scope_params)
      render :show, status: :ok, location: @access_scope
    else
      render json: @access_scope.errors, status: :unprocessable_entity
    end
  end

  # DELETE /access_scopes/1
  # DELETE /access_scopes/1.json
  def destroy
    @access_scope.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access_scope
      @access_scope = AccessScope.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def access_scope_params
      params.require(:access_scope).permit(:handle)
    end
end
