module UsuariosHelper
        def superadmin_valid(usuario)
            if usuario.role == Role.find(1)
              return true
            else
              return false
            end
        end
        def admin_valid(usuario)
            if usuario.role == Role.find(2)
              return true
            else
              return superadmin_valid(usuario)
            end
        end
        def chat_bot(usuario)
            if usuario.role == Role.find(3)
              return true
            else
              return admin_valid(usuario)
            end
        end
end
