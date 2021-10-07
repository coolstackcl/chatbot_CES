class AddDiaToProfesors < ActiveRecord::Migration[6.1]
  def change
    add_column :profesors, :dia, :string
  end
end
