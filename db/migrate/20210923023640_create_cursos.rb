class CreateCursos < ActiveRecord::Migration[6.1]
  def change
    create_table :cursos do |t|
      t.string :numero
      t.string :letra
      t.string :nivel
      t.string :jornada

      t.timestamps
    end
  end
end
