class Item < ApplicationRecord
  validates :isbn, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 255 }
  validates :author, length: { maximum: 255 }
  validates :image_url, presence: true, length: { maximum: 255 }

  
  has_many :ownerships
  has_many :users, through: :ownerships
  
  has_many :addtos
  has_many :addto_users, through: :addtos, source: :user
end