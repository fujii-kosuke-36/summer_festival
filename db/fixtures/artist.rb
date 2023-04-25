require 'csv'

csv = CSV.read('db/fixtures/csv/artist.csv', headers: true)
csv.each do |artist|
  Artist.seed do |s|
    s.id = artist[0]
    s.artist_name = artist[1]
    s.artist_image = artist[2]
  end
end
