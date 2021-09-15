json.extract! profesor, :id, :nombre, :apellido, :email, :inicioatencion, :finatencion, :created_at, :updated_at
json.url profesor_url(profesor, format: :json)
