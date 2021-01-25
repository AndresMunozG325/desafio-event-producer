class ChangeColumnInTable < ActiveRecord::Migration[6.0]
  def change
    change_column(:groups, :type_of_band, :integer)
  end
end
