class Post < ApplicationRecord

	belongs_to :user
	belongs_to :genre
	has_many :favorites
	has_many :favorited_users, through: :favorites, source: :user
	has_many :comments, dependent: :destroy

end
