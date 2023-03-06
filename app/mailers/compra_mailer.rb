class CompraMailer < ApplicationMailer
  def new_order_email
    @carrito = params[:carrito]
    @usuario = params[:usuario]
    @compra = params[:compra]
    mail(to: "example@gmail.com", subject: "You got a new order!")
  end
end
