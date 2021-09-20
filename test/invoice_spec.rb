require_relative './lib/item'
require_relative './lib/itemrepository'
require_relative 'bigdecimal'
require_relative 'bigdecimal/util'
require_relative 'objspace'
require_relative './lib/sales_engine'
require_relative './lib/merchant'
require_relative './lib/merchantrepository'
require_relative'./lib/invoice'
require_relative 'csv'

describe Invoice do
  it 'exists' do
    se = SalesEngine.from_csv({:invoices => "./data/invoices.csv"})

    i = Invoice.new({
                    :id          => 6,
                    :customer_id => 7,
                    :merchant_id => 8,
                    :status      => "pending",
                    :created_at  => Time.now,
                    :updated_at  => Time.now,
                    })

  expect(i).to be_a(Invoice)
  expect(i.id).to eq(6)
  end
end
