class Asignaturaprofesor < ApplicationRecord
  belongs_to :profesor
  belongs_to :asignatura
end
