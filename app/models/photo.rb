class Photo < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  has_many_attached :images


  has_one_attached :attachment
end
