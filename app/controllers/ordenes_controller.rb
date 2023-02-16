class OrdenesController < ApplicationController
  before_action :set_ordene, only: %i[ show update destroy ]

  # GET /ordenes
  def index
    @ordenes = Ordene.all

    render json: @ordenes
  end

  # GET /ordenes/1
  def show
    render json: @ordene
  end

  # POST /ordenes
  def create
    @ordene = Ordene.new(ordene_params)

    if @ordene.save
      render json: @ordene, status: :created, location: @ordene
    else
      render json: @ordene.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ordenes/1
  def update
    if @ordene.update(ordene_params)
      render json: @ordene
    else
      render json: @ordene.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ordenes/1
  def destroy
    @ordene.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordene
      @ordene = Ordene.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ordene_params
      params.require(:ordene).permit(:total, :Float, :cantidad, :Integer)
    end
end
