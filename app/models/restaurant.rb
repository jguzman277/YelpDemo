class Restaurant < ApplicationRecord
	mount_uploader :image, ImageUploader

	searchkick

	has_many :reviews

	validates :name, :address, :phone, :website, :image, presence: true
	validates :phone, format: { with: /\A\(\d{3}\) \d{3}-\d{4}\z/, message: "must be in the format (555) 123-4567"}
	validates :website, format: {with: /\Ahttps?:\/\/.*\..*\z/, message: "must be in the format http(s)://****.***"}
	validates :address, format: {with: /\A\d+[^,]+, [^,]+, [A-Z]{2} \d{5}\z/, message: "must be in the format of street address, city, state, zip code"}

end

class Document < ActiveRecord::Base
	include ElasticSearch::Model
end