class CreateAsignaturacursos < ActiveRecord::Migration[6.1]
  def change
    create_table :asignaturacursos do |t|
      t.references :curso, null: false, foreign_key: true
      t.references :asignatura, null: false, foreign_key: true

      t.timestamps
    end
  end
end
