require 'open-uri'

class Unit < ApplicationRecord
  belongs_to :unit_type

  validates_presence_of :mul_id, :name
  
  def image_url
    cached_image_url || get_image
  end

  def mul_link
    "http://masterunitlist.info/Unit/Details/#{mul_id}/"
  end

  def mul_custom_card_link
    "http://masterunitlist.info/Tools/CustomCard/#{mul_id}"
  end
  
  private

  def get_image
    doc = Nokogiri::HTML(URI.open(mul_link))
    image_field = doc.xpath('/html/body/div[1]/div/div[1]/div[1]/div[1]/a/img').first
    image_url = image_field&.attributes&.dig("src")&.value

    if image_url.nil?
      Rails.logger.debug "No image found for #{name}"
      return nil
    end

    update!(cached_image_url: image_url)
    image_url
  rescue OpenURI::HTTPError
    Rails.logger.debug "Got 500 error for #{name}, skipping"
  end
end
