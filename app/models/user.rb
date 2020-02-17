class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  has_one_attached :image
  scope :by_user_name, -> (text){where("name like (?)", "%#{text}%")}
end
