class CreateEstablecimientos < ActiveRecord::Migration[6.1]
  def change
    create_table :establecimientos do |t|
      t.string :nombre
      t.string :ciudad
      t.string :rbd
      t.string :direccion
      t.string :telefono
      t.string :email
      t.string :director

      t.timestamps
    end
  end
end
