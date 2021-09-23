class CreateRegasignaturas < ActiveRecord::Migration[6.1]
  def change
    create_table :regasignaturas do |t|
      t.references :asignatura, null: false, foreign_key: true
      t.references :establecimiento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
