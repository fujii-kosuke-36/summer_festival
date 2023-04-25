require 'csv'

csv = CSV.read('db/fixtures/csv/festival.csv', headers: true)
csv.each do |festival|
  Festival.seed do |s|
    s.id = festival[0]
    s.name = festival[1]
    s.location = festival[2]
    s.prefecture = festival[3]
    s.region = festival[4]
  end
end