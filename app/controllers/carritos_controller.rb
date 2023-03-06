class CarritosController < ApplicationController
  before_action :set_carrito, only: %i[show update destroy]
  before_action :set_compra, only: %i[destroy]
  before_action :set_usuario, only: %i[destroy]
  before_action :authenticate_usuario!
  load_and_authorize_resource
  # GET /carritos
  def index
    @carritos = Carrito.all

    render json: @carritos
  end

  # GET /carritos/1
  def show
    render json: { data: @carrito, ordenes: @carrito.ordenes }
  end

  # POST /carritos
  def create
    @carrito = Carrito.new(carrito_params)

    if @carrito.save
      render json: @carrito, status: :created, location: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carritos/1
  def update
    if @carrito.update(carrito_params)
      render json: @carrito
    else
      render json: @carrito.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carritos/1
  # Empty your carrito not destroy the carrito
  def destroy
    if @carrito.ordenes.exists?
      @compra.ordenes << @carrito.ordenes
      @compra.total = @compra.ordenes.sum("total")
      d = Date.parse(3.days.from_now.to_s)
      @compra.entrega = d.strftime("%d/%m/%Y")
      @carrito.ordenes = []

      CompraMailer.with(usuario: @usuario, compra: @compra).new_order_email
    else
      render json: "Carrito is already empty", status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_compra
    @compra = Usuario.find(params[:usuario_id]).compras.last
  end

  def set_carrito
    @carrito = Carrito.find(params[:id])
  end

  def set_usuario
    @usuario = Usuario.find(params[:usuario_id])
  end

  #Only allow a list of trusted parameters through.
  def carrito_params
    params.require(:carrito).permit(:usuario_id)
  end
end
