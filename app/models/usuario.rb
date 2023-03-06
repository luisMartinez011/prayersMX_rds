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
  enum rol: { usuario: 0, admin: 1 }, _prefix: true

  has_one :carrito
  has_many :compras

  validates :nombre, presence: true, on: :create
  validates :telefono, presence: true, on: :create
  validates :calle, presence: true, on: :create
  validates :ciudad, presence: true, on: :create
  validates :estado, presence: true, on: :create
  validates :pais, presence: true, on: :create
  validates :numero_casa, presence: true, on: :create
  validates :imagen, presence: true, on: :create

  def create_relationships
    self.carrito = Carrito.create
    self.compras << Compra.create
  end
end
