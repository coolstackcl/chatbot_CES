class Regasignatura < ApplicationRecord
  belongs_to :asignatura
  belongs_to :establecimiento
end
