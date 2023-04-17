require 'mechanize'
require 'csv'
require 'pry-byebug'

agent = Mechanize.new
page = agent.get('https://rijfes.jp/2022/lineup/artists/')
# スクレイピングで取得したデータ
elements = page.search('.c-artist__image img')

elements.each do |ele|
  puts ele.get_attribute('src')
  sleep 1
end

# elements = page.search('.l-content')
# data = []
# artists = page.search('.c-artist__title')
# artists.each do |data|
#   p data.inner_html
#   sleep 1
# end
