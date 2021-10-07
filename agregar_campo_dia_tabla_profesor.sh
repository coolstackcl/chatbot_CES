# Se agregó:
# rails generate migration AddDiaToProfesors dia

# en la version de aws hay que ejecutar:
rails db:migrate

# cargar valores a los campos (de momento aleatorios)
dias = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo']
Profesor.all.each {|p| p.update dia: dias[rand(dias.length)]}