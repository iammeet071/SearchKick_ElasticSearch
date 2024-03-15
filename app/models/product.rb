class Product < ApplicationRecord
  searchkick text_middle: %i[:product_name :product_details]
  after_save :update_filter_name

  private

  def update_filter_name
    unless Filter.exists?(name: product_details)
    filter = Filter.find_or_initialize_by(name: product_details)
    filter.save if filter.new_record? || filter.name_changed?
    end
  end
end
