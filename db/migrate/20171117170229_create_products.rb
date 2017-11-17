class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :cost_in_usa_cents, :int
      t.column :country_of_origin, :string

      t.timestamps
    end
  end
end
