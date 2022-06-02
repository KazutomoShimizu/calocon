class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  has_many :foods, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :weight_histories
end
