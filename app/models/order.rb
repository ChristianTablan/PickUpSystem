class Order < ApplicationRecord
	has_many :order_items 
	before_save :set_total

	def total
		order_items.collect{|order_item| order_item.valid? ? order_item.unit_price * order_item.quantity : 0}.sum

	end

	def qctax
		order_items.collect{|order_item| order_item.valid? ? order_item.unit_price * order_item.quantity * 0.09975 : 0}.sum
	end

	def canadatax
		order_items.collect{|order_item| order_item.valid? ? order_item.unit_price * order_item.quantity * 0.05 : 0}.sum
	end

	def subtotal
		return total + qctax + canadatax
	end


	private

	def set_total
		self[:total] = total;
	end

end
