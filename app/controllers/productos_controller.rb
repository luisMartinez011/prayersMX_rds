class ProductosController < ApplicationController
  before_action :set_producto, only: %i[show update destroy]
  before_action :authenticate_usuario!, except: %i[index show]
  load_and_authorize_resource
  # GET /productos
  def index
    @productos = Producto.all
    CompraMailer.new_order_email.deliver_later
    render json: @productos
  end

  # GET /productos/1
  def show
    render json: @producto
  end

  # POST /productos
  def create
    @producto = Producto.new(producto_params)

    if @producto.save
      render json: @producto, status: :created, location: @producto
    else
      render json: @producto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /productos/1
  def update
    if @producto.update(producto_params)
      render json: @producto
    else
      render json: @producto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /productos/1
  def destroy
    @producto.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_producto
    @producto = Producto.find(params[:id])
  end
  # Only allow a list of trusted parameters through.
  def producto_params
    params.require(:producto).permit(
      :precio,
      :nombre,
      :descripcion,
      :imagen,
      :cantidad
    )
  end
end
