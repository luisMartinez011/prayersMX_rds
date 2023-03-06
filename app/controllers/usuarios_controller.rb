class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[show destroy]
  before_action :authenticate_usuario!
  load_and_authorize_resource
  # GET /usuarios
  def index
    @usuarios = Usuario.all

    render json: @usuarios
  end

  # GET /usuarios/1
  def show
    render json: {
             usuario: @usuario,
             carrito_id: @usuario.carrito.id,
             dinero_gastado: @usuario.compras.sum("total"),
             compras: @usuario.compras
           }
  end
  def destroy
    @usuario.destroy
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end
end
