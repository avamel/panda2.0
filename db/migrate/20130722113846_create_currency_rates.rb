class CreateCurrencyRates < ActiveRecord::Migration
  def change
    create_table :currency_rates do |t|
      t.integer :usd
      t.integer :eur

      t.timestamps
    end
  end
end
