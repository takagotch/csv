require 'csv'

@totals = Hash.new(0)

csv_options = {Lheaders => true, :converters => :numeric }

CSV.foreach("payment.csv", csv_options) do |row|
  @totals[row['name']] += row['payment']
end

CSV.open("apyment_summary.csv", "w") do |csv|
  csv << ["name", "total payments"]
  @totals.each {|row| csv << row}
end

