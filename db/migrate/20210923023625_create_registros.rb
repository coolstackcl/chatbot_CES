class CreateRegistros < ActiveRecord::Migration[6.1]
  def change
    create_table :registros do |t|
      t.references :usuario, null: false, foreign_key: true
      t.references :establecimiento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
