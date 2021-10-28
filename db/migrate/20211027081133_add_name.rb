class AddName < ActiveRecord::Migration[6.1]
  def change
    add_column :counts, :name, :string
  end
end
