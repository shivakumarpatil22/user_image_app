class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  has_one_attached :image
  scope :by_user_name, -> (text){where("first_name like (?) or last_name like (?) or email like (?)", "%#{text}%","%#{text}%","%#{text}%")}
end
