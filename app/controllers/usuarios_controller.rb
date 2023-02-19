class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[show destroy]
  # GET /usuarios
  def index
    @usuarios = Usuario.all

    render json: @usuarios
  end

  # GET /usuarios/1
  def show
    render json: @usuario
  end
  def destroy
    @usuario.destroy
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end
end
