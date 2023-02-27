class OrdenesController < ApplicationController
  before_action :set_ordene, only: %i[show update destroy]
  before_action :set_producto, only: :create
  before_action :set_carrito, only: %i[create]
  before_action :authenticate_usuario!
  load_and_authorize_resource

  # GET /ordenes
  def index
    @ordenes = Ordene.all

    render json: @ordenes
  end

  # GET /ordenes/1
  def show
    @ordenes = Ordene.where(carrito_id: @carrito.id)
    render json: @ordene
  end

  # POST /ordenes
  def create
    @ordene = Ordene.new(ordene_params)

    @ordene.producto_id << @producto.id

    @ordene.total = @ordene.cantidad * @producto.precio

    if @ordene.save
      @carrito.ordenes << @ordene
      @carrito.total = @carrito.ordenes.sum("total")
      @carrito.save
      render json: @ordene, status: :created, location: @ordene
    else
      render json: @ordene.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ordenes/1
  def update
    if @ordene.update(ordene_params)
      @ordene.producto_id << @producto.id

      @ordene.total = @ordene.cantidad * @producto.precio
      @ordene.save
      @carrito.ordenes << @ordene
      @carrito.total = @carrito.ordenes.sum("total")
      @carrito.save
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
  #
  def set_producto
    @producto = Producto.find(params[:producto_id])
  end

  def set_ordene
    @ordene = Ordene.find(params[:id])
  end

  def set_carrito
    usuario_id = Usuario.where(uid: params[:uid]).first.id
    @carrito = Usuario.find(usuario_id).carrito
  end

  # Only allow a list of trusted parameters through.
  def ordene_params
    params.require(:ordene).permit(:cantidad, :producto_id, :usuario_id)
  end
end
