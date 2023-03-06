require 'mechanize'
require 'csv'
require 'pry-byebug'
agent = Mechanize.new

page = agent.get('https://rijfes.jp/2022/lineup/artists/')
# スクレイピングで取得したデータ


elements = page.search('.l-content')
 #puts elements
data = []

# # それぞれアクセスする
#elements.each_with_index do |ele, i|
  
  artists = page.search('.c-artist__title')
  #artists = page.search('#rijf2019').search('.c-history__artists')
  #dates = page.search('#rijf2021').search('.c-history__heading2')
 
  artists.each do |data|
    p data.inner_html
    sleep 1
  end
  
#   date_details = page.search('.c-history__heading2')
#   artists = page.search('.c-history__artists')
  #puts dates.inner_text
#end
#.gsub(/\.\.carbonated\//, ""）


# bom = %w[EF BB BF].map { |e| e.hex.chr }.join
# csv_file = CSV.generate(bom) do |csv|
#   data.each do |datum|
#     csv << datum
#   end
# end

# File.open('./item3-product.csv', 'w', force_quotes: true) do |file|
#   file.write(csv_file.force_encoding('UTF-8'))
# end