class CreateRegcursos < ActiveRecord::Migration[6.1]
  def change
    create_table :regcursos do |t|
      t.references :establecimiento, null: false, foreign_key: true
      t.references :curso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
