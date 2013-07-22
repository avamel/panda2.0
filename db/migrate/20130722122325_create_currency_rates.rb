class CreateCurrencyRates < ActiveRecord::Migration
  def change
    create_table :currency_rates do |t|
      t.string :usd
      t.string :eur

      t.timestamps
    end
  end
end
