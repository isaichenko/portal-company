class Employee < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  #scope :posts_by, ->(user) { where(user_id: user.id) }
  scope :ip_phone, -> { where.not(ip_phone: [nil, '']) }

  def self.by_sort_position
  	order("sort_position ASC")
  end

end
