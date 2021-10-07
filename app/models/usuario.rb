class Usuario < ApplicationRecord
  has_secure_password
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX, message: "%{value} no es se encuentra en el formato correcto"}
  validates :password, :password_confirmation, length: {minimum: 8, maximum: 72, message: "%{value} no se encuentra en el formato correcto"}, on: :create
  #validates_confirmation_of :password
  validates :nombre, :apellido, :email, presence: { strict: false, message: "%{value} no puede estar en blanco" }
  validates :password, :password_confirmation, presence: { strict: false, message: "%{value} no puede estar en blanco" }
  validates :nombre, :apellido, length: {minimum: 2, message: "%{value} debe tener más de 2 caracteres"}
  before_save :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end

  belongs_to :role
end
