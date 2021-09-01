class Cat < ApplicationRecord
  has_one_attached :image
  include Rails.application.routes.url_helpers #using this for the url_for method below.

  validates :image, { presence: true }

  def get_image_url
    #using this to get the url for the image to add to the json response
    url_for(self.image)
  end
end
