class Cat < ApplicationRecord
  has_one_attached :image

  validates :image, { presence: true }
end
