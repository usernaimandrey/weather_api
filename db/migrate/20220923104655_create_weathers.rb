class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.integer :minimal_temperature
      t.integer :maximal_temperature
      t.integer :avg_temperature
      t.integer :current_temperature
      t.datetime :data

      t.timestamps
    end
  end
end
