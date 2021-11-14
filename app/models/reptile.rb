class Reptile < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :reptile_comments, dependent: :destroy
end
