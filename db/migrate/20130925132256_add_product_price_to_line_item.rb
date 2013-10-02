class AddProductPriceToLineItem < ActiveRecord::Migration
    #def change
   # add_column :line_items, :price, :decimal
  #end

  def self.up
  	add_column :line_items, :price, :decimal, :precision =>8, :scale => 2
  	#LineItem.reset_column_information
  	#say_with_time "Updating prices..." do
  		#LineItem.find(:all).each do |lineitem|
  		#	lineitem.update_attribute :price, limeitem.product.price
  		#end
  	#end

    LineItem.all.each do |line|
      line.update_attributes :price => line.product.price
    end
  	
  end

  def self.down
  	remove_column :line_items, :price
  end
end
