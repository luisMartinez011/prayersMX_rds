class CompraMailer < ApplicationMailer
  def new_order_email
    @usuario = params[:usuario]
    @compra = params[:compra]
    mail(to: @usuario.email, subject: "Recibo de compra PrayersMx")
  end
end
