Product.class_eval do
  has_and_belongs_to_many :accessories, :class_name => "Product", :join_table => "accessories" , :association_foreign_key => "accessory_product_id"
end
