class CreateProfesors < ActiveRecord::Migration[6.1]
  def change
    create_table :profesors do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.time :inicioatencion
      t.time :finatencion

      t.timestamps
    end
  end
end
