class Usuario < ApplicationRecord
  has_secure_password
  belongs_to :role
end
