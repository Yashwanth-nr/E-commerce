class Product < ActiveRecord::Base

	belongs_to :category

	has_many :carts

	has_many :order_line_items

	has_many :reviews

	
	mount_uploader :cover, CoverUploader

	validates_presence_of :name, :category_id, :price, :stock

	
	validates_numericality_of :price, greater_than: 1

	validates_numericality_of :stock, greater_than_or_equal_to: 0 





end
