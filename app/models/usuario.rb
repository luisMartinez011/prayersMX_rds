# frozen_string_literal: true

class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models
  after_create :create_relationships

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  include DeviseTokenAuth::Concerns::User
  enum role: { usuario: 0, admin: 1 }, _prefix: true

  has_one :carrito
  has_one :compra

  def create_relationships
    self.carrito = Carrito.create
    self.compra = Compra.create
  end
end
