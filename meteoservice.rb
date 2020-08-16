# Данные берем из XML метеосервиса http://www.meteoservice.ru/content/export.html
# Подключаем библиотеку для работы c адресами URI
require 'uri'
# Подключаем библиотеку для загрузки данных по http-протоколу
require 'net/http'
require 'rexml/document'

TOD = %w(ночь утро день вечер).freeze
CLOUDINESS = %w(Ясно Малооблачно Облачно Пасмурно Туман).freeze
CITIES ={
  'Москва' => 37,
  'Пермь' => 59,
  'Санкт-Петербург' => 69,
  'Новосибирск' => 99,
  'Орел' => 115,
  'Чита' => 121,
  'Братск' => 141,
  'Краснодар' => 199
}

def makeforecast(node)
  day =  node.attributes['day']
  month =node.attributes['month']
  year =node.attributes['year']
  day_time = node.attributes['tod'].to_i
  min_temp = node.elements['TEMPERATURE'].attributes['min']
  max_temp = node.elements['TEMPERATURE'].attributes['max']
  wind = node.elements['WIND'].attributes['max']
  cloud = node.elements['PHENOMENA'].attributes['cloudiness'].to_i

  "#{day} #{month} #{year}, #{TOD[day_time]}\n" \
  "#{min_temp}..#{max_temp}, ветер #{wind} м/с, #{CLOUDINESS[cloud]}\n\n"
end

puts "Вырите город, для которого показать прогноз погоды"
CITIES.keys.each_with_index { |item, index| puts "#{index}: #{item}" }
choice = STDIN.gets.to_i
city_index = CITIES[CITIES.keys[choice]]

uri = URI.parse("https://xml.meteoservice.ru/export/gismeteo/point/#{city_index}.xml")
# Отправляем HTTP-запрос по указанному адресу и записываем ответ в response.
response = Net::HTTP.get_response(uri)
# Из тела ответа (body) формируем XML документ
doc = REXML::Document.new(response.body)

#вывод названия города
puts URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])
puts

doc.root.each_element('//FORECAST') do |i|
  puts makeforecast(i)
end
