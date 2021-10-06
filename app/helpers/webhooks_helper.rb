module WebhooksHelper

    def contacto_profesor_nombre(event)
        nombre = param_valid(event["parameters"]["nombre"]).downcase!
        apellido = param_valid(event["parameters"]["apellido"]).downcase!
        # establece logica para contestar
        if nombre&&apellido # todos los datos
            profesor = Profesor.where(nombre: nombre).where(apellido: apellido)
            if !profesor.empty?
                email = profesor.first.email
                horario = mod_hour(profesor.first.inicioatencion) + "/ " + mod_hour(profesor.first.finatencion)
                text = event["fulfillmentText"].gsub('#{email}', email).gsub('#{horario}', horario).gsub('#{nombre}', nombre).gsub('#{apellido}', apellido)
            else
                text = "Los datos de #{nombre} #{apellido} no están disponibles"
            end
        else # datos faltantes
            if nombre # falta apellido
                text = "Por favor ingrese el apellido del profesor que necesitas contactar"
            elsif apellido # falta nombre
                text = "Por favor ingrese el nombre del profesor que necesitas contactar"
            else # falta nombre y apellido
                text = "El contacto de quién necesita?"
            end
        end
        # retorna texto
        return text      
    end

    def contacto_profesor_curso(event)
        curso = param_valid(event["parameters"]["curso"])
        numero = curso.split(" ")[0]
        letra = curso.split(" ")[1]
        asignatura = param_valid(event["parameters"]["asignatura"])
        # establece logica para contestar
        text = ""
        if curso&&asignatura # todos los datos
            if numero=="Kinder"||numero=="Pre-Kinder"
                text = contacto_curso(event)
            else
                c = Curso.where(numero: numero).where(letra: letra)
                a = Asignatura.where(nombre: asignatura)

                if !c.empty?&!a.empty?
                    profesor = Asignaturaprofesor.where(curso: c).where(asignatura: a).first.profesor
                    nombre = profesor.nombre
                    apellido = profesor.apellido
                    email = profesor.email
                    horario = mod_hour(profesor.inicioatencion) + "/ " + mod_hour(profesor.finatencion)
                    text = event["fulfillmentText"].gsub('#{email}', email).gsub('#{horario}', horario).gsub('#{nombre}', nombre).gsub('#{apellido}', apellido)
                else
                    text = "Los datos del #{curso} no están disponibles"
                end
            end
        end
        # retorna texto
        return text      
    end

    def contacto_curso(event)
        curso = param_valid(event["parameters"]["curso"])
        numero = curso.split[0]
        letra = curso.split[1]
        # establece logica para contestar
        puts numero
        puts letra
        if numero&&letra # todos los datos
            curso = Curso.where(numero: numero).where(letra: letra)
            puts 'paso curso'
            if !curso.empty?
                nivel = curso.first.nivel
                puts nivel
                jornada = curso.first.jornada
                puts jornada
                profesor = "#{Profesorjefe.find_by(curso:curso).profesor.nombre} #{Profesorjefe.find_by(curso:curso).profesor.apellido}"
                puts profesor
                email = Profesorjefe.find_by(curso:curso).profesor.email
                puts email
                text = event["fulfillmentText"].gsub('#{nivel}', nivel).gsub('#{jornada}', jornada).gsub('#{profesor}', profesor).gsub('#{numero}', numero).gsub('#{letra}', letra).gsub('#{email}', email)
                puts text
            else
                text = "La información del #{numero} #{letra} no se encuentra disponible"
            end
        else # datos faltantes
            if numero # falta apellido
                text = "Por favor ingrese la letra del curso"
            elsif letra # falta nombre
                text = "Por favor ingrese el numero del curso"
            else # falta nombre y apellido
                text = "qué curso necesita?"
            end
        end
        # retorna texto
        return text      
    end

    private
    def param_valid(event)
        if event
            result = event
        else
            result = nil
        end
        return result
    end

    def mod_hour(n)
        h = n.hour()
        m = n.min()
        if h<8
            h+=12
        end

        def num2hour(x)
            if x<10
                x = "0" + x.to_s
            else
                x = x.to_s
            end
            return x
        end
    
        return num2hour(h) + ":" + num2hour(m)
    end

end
