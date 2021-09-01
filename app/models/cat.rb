class Cat < ApplicationRecord
  has_one_attached :image
  include Rails.application.routes.url_helpers

  validates :image, { presence: true }

  def get_image_url
    url_for(self.image)
  end
end
