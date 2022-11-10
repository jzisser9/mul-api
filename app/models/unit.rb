require 'open-uri'

class Unit < ApplicationRecord
  belongs_to :unit_type

  validates_presence_of :mul_id, :name

  def image_url
    doc = Nokogiri::HTML(URI.open(mul_custom_card_link))
    doc.search('#Data_Image').first.content.gsub("\r\n", '')
  end

  def mul_link
    "http://masterunitlist.info/Unit/Details/#{mul_id}/"
  end

  def mul_custom_card_link
    "http://masterunitlist.info/Tools/CustomCard/#{mul_id}"
  end
end
