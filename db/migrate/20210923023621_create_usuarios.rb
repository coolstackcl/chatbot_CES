class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :password_digest
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
