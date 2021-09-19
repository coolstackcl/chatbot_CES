# crear relaciones entre tablas

# Establecimiento
establecimientos = ["Colegio Ejercito de Salvacion Puerto Montt"]
rbds = ['7704-6']#Entregado por FM
ciudad = ['Puerto Montt']
direccions = ['séptimo de línea 148 (913,83 km) Ciudad de Puerto Montt, Chile']#sacado de facebook
telefonos = ['(65) 225 4047']#sacado de facebook
emails = ['secretaria@cespuertomontt.cl']#contacto de secretaria del colegio
directores = ['Juan Carlos Laurence Santana']#sacado del proyecto educativo del 2020
(0...rbds.length).each do |i|
    Establecimiento.create(nombre: establecimientos[i], ciudad: ciudad[i], rbd: rbds[i],
         direccion:direccions[i], telefono: telefonos[i], email: emails[i], director: directores[i])
end

#Roles
roles = ['Superadmin', 'Admin', 'chatbot'] # se dejan 2 roles + chatbot

roles.each do |rol|
    Role.create(rol: rol)
end

# Usuarios
# Superadministrador
Usuario.create(nombre:"Carlos" , apellido:"Saquel" , email:"carlos.saquel@correo.cl", password:"admin123", password_confirmation:"admin123", role: Role.find(1)) 
Usuario.create(nombre:"Cristobal" , apellido:"Fernandez" , email:"cristobal.fernandez@correo.cl", password:"admin123", password_confirmation:"admin123", role: Role.find(1)) 
Usuario.create(nombre:"Adrian" , apellido:"Calcumil" , email:"adrian.calcumil@correo.cl", password:"admin123", password_confirmation:"admin123", role: Role.find(1)) 
Usuario.create(nombre:"Francisco" , apellido:"Minio" , email:"francisco.minio@correo.cl", password:"admin123", password_confirmation:"admin123", role: Role.find(1)) 
# Chat Bot
Usuario.create(nombre:"Chat" , apellido:"Bot" , email:"info.bot@correo.cl", password:"admin123", password_confirmation:"admin123", role: Role.find(3)) 


# Usuarios-Establecimientos
Registro.create(usuario: Usuario.find(1), establecimiento: Establecimiento.find(1)) 
Registro.create(usuario: Usuario.find(2), establecimiento: Establecimiento.find(1)) 
Registro.create(usuario: Usuario.find(3), establecimiento: Establecimiento.find(1)) 
Registro.create(usuario: Usuario.find(4), establecimiento: Establecimiento.find(1)) 
Registro.create(usuario: Usuario.find(5), establecimiento: Establecimiento.find(1)) 


# Profesores
Profesor.create(nombre: "Claudia", apellido: "Aguilera", email: "caguilera@cespuertomontt.cl", inicioatencion: "9:00", finatencion: "10:00")
Profesor.create(nombre: "Marcela", apellido: "Maldonado", email: "mmaldonado@cespuertomontt.cl", inicioatencion: "3:00", finatencion: "4:00")
Profesor.create(nombre: "Yoana", apellido: "Miranda", email: "ymiranda@cespuertomontt.cl", inicioatencion: "2:00", finatencion: "3:00")
Profesor.create(nombre: "Hanimi", apellido: "Mellado", email: "hmellado@cespuertomontt.cl", inicioatencion: "8:00", finatencion: "9:00")
Profesor.create(nombre: "Lina", apellido: "Carrasco", email: "lcarrasco@cespuertomontt.cl", inicioatencion: "9:00", finatencion: "10:00")
Profesor.create(nombre: "Yesenia", apellido: "Coronado", email: "ycoronado@cespuertomontt.cl", inicioatencion: "4:00", finatencion: "5:00")
Profesor.create(nombre: "Camila", apellido: "Siebald", email: "csiebald@cespuertomontt.cl", inicioatencion: "3:30", finatencion: "4:30")
Profesor.create(nombre: "Ana", apellido: "Solis", email: "asolis@cespuertomontt.cl", inicioatencion: "3:00", finatencion: "4:00")
Profesor.create(nombre: "Lucía", apellido: "Muñoz", email: "lmunoz@cespuertomontt.cl", inicioatencion: "9:20", finatencion: "10:20")
Profesor.create(nombre: "Ruth", apellido: "Aguilar", email: "raguilar@cespuertomontt.cl", inicioatencion: "2:00", finatencion: "3:00")
Profesor.create(nombre: "Sandra", apellido: "González", email: "sgonzalez@cespuertomontt.cl", inicioatencion: "9:30", finatencion: "10:30")
Profesor.create(nombre: "Eliana", apellido: "Soto", email: "esoto@cespuertomontt.cl", inicioatencion: "3:00", finatencion: "4:00")
Profesor.create(nombre: "Francisco", apellido: "Igor", email: "figor@cespuertomontt.cl", inicioatencion: "10:30", finatencion: "11:30")
Profesor.create(nombre: "Mauricio", apellido: "Rogel", email: "mrogel@cespuertomontt.cl", inicioatencion: "4:00", finatencion: "6:00")
Profesor.create(nombre: "Tatiana", apellido: "Soto", email: "tsoto@cespuertomontt.cl", inicioatencion: "12:00", finatencion: "1:00")
Profesor.create(nombre: "Débora", apellido: "Saldivia", email: "dsaldivia@cespuertomontt.cl", inicioatencion: "8:00", finatencion: "9:00")


# Relacion Colegio Profesor
(1..Profesor.all.length).each do |i|
    Regprofesor.create(profesor:Profesor.find(i), establecimiento:Establecimiento.find(1))
end

### FALTA LA SGTE INFORMACION ### (hacia arriba ya está cargado)
# - Jornada de cursos
# - Listado de asignaturas
# - Profesor x asignatura x curso


