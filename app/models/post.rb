class Post < ApplicationRecord

	belongs_to :user
	has_many :favorites
	has_many :favorited_users, through: :favorites, source: :user
	has_many :comments, dependent: :destroy

end
