require 'csv'
require './lib/merchantrepository'
require './lib/itemrepository'
require './lib/sales_engine'

class SalesAnalyst < SalesEngine

  @@se = SalesEngine.from_csv({
    :items     => "./data/items.csv",
    :merchants => "./data/merchants.csv",
  })

  def initialize
  end

  def average_items_per_merchant
    ir = @@se.items
    mr = @@se.merchants

    ((ir.all.count.to_f) / (mr.all.count.to_f)).round(2)
  end

  def average_items_per_merchant_standard_deviation
    ir = @@se.items
    mr = @@se.merchants
    item_set = mr.all.map do |merchant|
      ir.find_all_by_merchant_id(merchant.id).count
    end

    num = 0.0

    item_set.map do |item|

      num += ((item - average_items_per_merchant)**2)

    end
    sd = (num / 475)
    Math.sqrt(sd).round(2)
  end

  def merchants_with_high_item_count
    #started psuedo coding this
    ir = @@se.items
    mr = @@se.merchants
    high_items = []

    ipm = ir.map do |merchant|
      count = 0
      
      "items per each merchant"
    end

    if ipm > (average_items_per_merchant + average_items_per_merchant_standard_deviation)
      high_items << "merchant"
    end

    high_items
  end
end
