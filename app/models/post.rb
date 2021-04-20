class Post < ApplicationRecord

	belongs_to :user
	belongs_to :genre
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	has_many :comments, dependent: :destroy
	attachment :image

	validates :title,  presence: { message: '動画タイトルが空欄です' }
	validates :body, presence: { message: '「ここがオススメ！」が空欄です' }
end
