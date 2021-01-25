class CambiandoColumna < ActiveRecord::Migration[6.0]
  def change
    rename_column :groups, :type, :type_of_band
  end
end
