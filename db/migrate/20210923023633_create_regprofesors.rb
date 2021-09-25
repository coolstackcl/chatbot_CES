class CreateRegprofesors < ActiveRecord::Migration[6.1]
  def change
    create_table :regprofesors do |t|
      t.references :profesor, null: false, foreign_key: true
      t.references :establecimiento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
