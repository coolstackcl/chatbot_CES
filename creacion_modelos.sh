# tabla con información de colegios
rails g scaffold Establecimiento nombre:string ciudad:string rbd:string direccion:string telefono:string email:string director:string --force

# tablas con información de usuarios de dashboard
rails g model Role rol:string --force
#  has_secure_password, agregar en el modelo de Usuario (si no, no funcionan las contraseñas)
rails g scaffold Usuario nombre:string apellido:string email:string password_digest:string role:references --force
rails g model Registro usuario:references establecimiento:references --force

# tablas con información de los colegios
## Profesores
rails g scaffold Profesor nombre:string apellido:string email:string inicioatencion:time finatencion:time --force
rails g model Regprofesor profesor:references establecimiento:references --force

## Asignatura
rails g scaffold Asignatura nombre:string --force
rails g model Regasignatura asignatura:references establecimiento:references --force
# rails g model Asignaturaprofesor profesor:references asignatura:references --force

# Curso
rails g scaffold Curso numero:string letra:string nivel:string jornada:string --force
rails g model Regcurso establecimiento:references curso:references --force
rails g model Asignaturacurso curso:references asignatura:references --force
rails g model Profesorjefe profesor:references curso:references --force
# agrego referencia a curso en tabla relacional
rails g model Asignaturaprofesor profesor:references asignatura:references curso:references --force

rake db:migrate