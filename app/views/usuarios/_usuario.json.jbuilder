json.extract! usuario, :id, :nombre, :apellido, :email, :password_digest, :role_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
