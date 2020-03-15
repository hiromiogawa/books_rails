class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :ownerships
  has_many :items, through: :ownerships
  
  has_many :addtos
  has_many :addto_items, through: :addtos, source: :item
  
  def addto(item)
    self.addtos.find_or_create_by(item_id: item.id)
  end

  def unaddto(item)
    addto = self.addtos.find_by(item_id: item.id)
    addto.destroy if addto
  end

  def addto?(item)
    self.addto_items.include?(item)
  end
end
