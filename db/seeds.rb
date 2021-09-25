# crear relaciones entre tablas

# Establecimiento
# ----------------
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

# Roles
# ----------------
roles = ['Superadmin', 'Admin', 'chatbot'] # se dejan 2 roles + chatbot

roles.each do |rol|
    Role.create(rol: rol)
end

# Usuarios
# ----------------
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
# ----------------
Profesor.create(nombre: "Claudia", apellido: "Aguilera", email: "caguilera@cespuertomontt.cl", inicioatencion: "9:00", finatencion: "10:00")
Profesor.create(nombre: "Marcela", apellido: "Maldonado", email: "mmaldonado@cespuertomontt.cl", inicioatencion: "3:00", finatencion: "4:00")
Profesor.create(nombre: "Yoana", apellido: "Miranda", email: "ymiranda@cespuertomontt.cl", inicioatencion: "2:00", finatencion: "3:00")
Profesor.create(nombre: "Hanimi", apellido: "Mellado", email: "hmellado@cespuertomontt.cl", inicioatencion: "8:00", finatencion: "9:00")
Profesor.create(nombre: "Lina", apellido: "Carrasco", email: "lcarrasco@cespuertomontt.cl", inicioatencion: "9:00", finatencion: "10:00")
Profesor.create(nombre: "Yesenia", apellido: "Coronado", email: "ycoronado@cespuertomontt.cl", inicioatencion: "4:00", finatencion: "5:00")
Profesor.create(nombre: "Camila", apellido: "Siebald", email: "csiebald@cespuertomontt.cl", inicioatencion: "3:30", finatencion: "4:30")
Profesor.create(nombre: "Ana", apellido: "Solís", email: "aSolís@cespuertomontt.cl", inicioatencion: "3:00", finatencion: "4:00")
Profesor.create(nombre: "Lucía", apellido: "Muñoz", email: "lmunoz@cespuertomontt.cl", inicioatencion: "9:20", finatencion: "10:20")
Profesor.create(nombre: "Ruth", apellido: "Aguilar", email: "raguilar@cespuertomontt.cl", inicioatencion: "2:00", finatencion: "3:00")
Profesor.create(nombre: "Sandra", apellido: "González", email: "sGonzález@cespuertomontt.cl", inicioatencion: "9:30", finatencion: "10:30")
Profesor.create(nombre: "Eliana", apellido: "Soto", email: "esoto@cespuertomontt.cl", inicioatencion: "3:00", finatencion: "4:00")
Profesor.create(nombre: "Francisco", apellido: "Igor", email: "figor@cespuertomontt.cl", inicioatencion: "10:30", finatencion: "11:30")
Profesor.create(nombre: "Mauricio", apellido: "Rogel", email: "mrogel@cespuertomontt.cl", inicioatencion: "4:00", finatencion: "6:00")
Profesor.create(nombre: "Tatiana", apellido: "Soto", email: "tsoto@cespuertomontt.cl", inicioatencion: "12:00", finatencion: "1:00")
Profesor.create(nombre: "Débora", apellido: "Saldivia", email: "dsaldivia@cespuertomontt.cl", inicioatencion: "8:00", finatencion: "9:00")
Profesor.create(nombre: "Christian", apellido: "González", email: nil, inicioatencion: nil, finatencion: nil)
Profesor.create(nombre: "Diego", apellido: "Carrillo", email: nil, inicioatencion: nil, finatencion: nil)
Profesor.create(nombre: "Soledad", apellido: "Navarrete", email: nil, inicioatencion: nil, finatencion: nil)


# Relacion Colegio Profesor
(1..Profesor.all.length).each do |i|
    Regprofesor.create(profesor:Profesor.find(i), establecimiento:Establecimiento.find(1))
end

# Asignaturas
# ----------------
asignaturas = ["Lenguaje y Comunicación", "Matemáticas", "Ciencias Naturales", "Historia y Geografía", "Inglés", "Artes Visuales", "Tecnología", "Educación Física", "Música", "Religión", "Orientación", "Taller Manual", "Taller Deportes", "Lengua y Literatura", "Taller de Teatro"]

(0...asignaturas.length).each do |i|
    Asignatura.create(nombre: asignaturas[i])
    # Relacion Asignatura Establecimiento
    Regasignatura.create(asignatura:Asignatura.find(i+1), establecimiento:Establecimiento.find(1))
end


# Curso
# ----------------
cursos = [
    ["Pre-Kinder", "A", "Pre-Básico", "Tarde"],
    ["Kinder", "A", "Pre-Básico", "Completa"],
    ["1", "A", "Básico", "Completa"],
    ["2", "A", "Básico", "Completa"],
    ["3", "A", "Básico", "Completa"],
    ["4", "A", "Básico", "Completa"],
    ["4", "B", "Básico", "Completa"],
    ["5", "A", "Básico", "Completa"],
    ["5", "B", "Básico", "Completa"],
    ["6", "A", "Básico", "Completa"],
    ["6", "B", "Básico", "Completa"],
    ["7", "A", "Básico", "Completa"],
    ["8", "A", "Básico", "Completa"]]

cursos.each {|c| Curso.create(numero: c[0], letra: c[1], nivel: c[2], jornada: c[3])}
cursos.each_with_index {|c,i| Regcurso.create(curso: Curso.find(i+1), establecimiento: Establecimiento.find(1))}

prof_asig = [# id de profesor (fila asignatura, columna curso)
    [3, 4, 5, 6, 7,	9, 9, 10, 10, nil, nil],
    [3, 4, 5, 6, 7,	14, 14, 15, 15, 15, 15],
    [3, 4, 5, 6, 7, 12, 14, 12, 12, 12, 12],
    [3, 4, 5, 6, 7,	13, 9, 13, 13, 13, 13],
    [11, 11, 11, 11, 11, 16, 16, 16, 16, 16, 16],
    [3, 4, 5, 6, 7, 14, 11, 11, 11, 14, 14],
    [3, 4, 5, 6, 7,	11, 11, 8, 11, 8, 8],
    [18, 4, 18, 17, 18, 17, 17, 17, 17, 17, 17],
    [3, 4, 3, 14, 14, 14, 11, 11, 11, 19, 19],
    [8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8],
    [3, 4, 5, 6, 7, 8, 9, 10, 11, nil, nil],
    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, 17, 17, 17, 17, 17, 17, 17, 17],
    [nil, nil, nil, nil, nil, nil, nil, nil, nil, 10, 10],
    [nil, nil, 9, nil, nil, nil, nil, 9, 9, 9, nil]]

# CursoAsignatura parte de id>=3 a 13
prof_asig.each_with_index do |p,i|
    Curso.all.each do |c|
        if c.id >=3
            if !p[c.id-3].nil?
                Asignaturacurso.create(curso: c, asignatura: Asignatura.find(i+1))
            end
        end    
    end
end

# Profesor jefe
Curso.all.each_with_index {|c,i| Profesorjefe.create(curso: c, profesor: Profesor.find(i+1))}


# Asignaturas-profesor (PRBLEMAS ACÁ, REHACER BD CON LOS DATOS CORREGIDOS)
Asignatura.all.each_with_index do |a,i|
    prof_asig[i].each_with_index do |p,j|
        if !p.nil?
            Asignaturaprofesor.create(curso: Curso.find(j+3), profesor: Profesor.find(p), asignatura: a)
        end
    end
end