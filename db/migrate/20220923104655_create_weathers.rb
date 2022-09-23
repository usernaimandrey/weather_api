class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.float :minimal_temperature
      t.float :maximal_temperature
      t.float :avg_temperature
      t.float :current_temperature
      t.datetime :data

      t.timestamps
    end
  end
end
