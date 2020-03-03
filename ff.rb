require 'nokogiri'
require 'open-uri'
require 'pry'

html = open("https://villains.fandom.com/wiki/Sephiroth")
sephiroth_doc = Nokogiri::HTML(html)
puts doc
html = open("https://finalfantasy.fandom.com/wiki/Cloud_Strife")
cloud_doc = Nokogiri::HTML(html)
puts doc

class Cloud
  
end
class Sephiroth
  
end

puts "Choose Character"
while false
puts "Cloud VS Sephiroth"
gets character

if character == "Cloud"
  
end