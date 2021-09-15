class CreateAsignaturaprofesors < ActiveRecord::Migration[6.1]
  def change
    create_table :asignaturaprofesors do |t|
      t.references :profesor, null: false, foreign_key: true
      t.references :asignatura, null: false, foreign_key: true

      t.timestamps
    end
  end
end
