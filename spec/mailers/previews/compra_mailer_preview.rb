# Preview all emails at http://localhost:3000/rails/mailers/compra_mailer
class CompraMailerPreview < ActionMailer::Preview
  def new_order_email
    usuario = FactoryBot.build(:usuario)
    compra = FactoryBot.build(:compra)
    CompraMailer.with(compra: compra, usuario: usuario).new_order_email
  end
end
