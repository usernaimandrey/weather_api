class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.float :current_temperature
      t.datetime :date_time

      t.timestamps
    end
  end
end
