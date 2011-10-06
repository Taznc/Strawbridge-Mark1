class Product < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :subgroups
  has_and_belongs_to_many :producttags
  has_many :comments, :as => :commentable
  has_and_belongs_to_many :related_products, :class_name => "Product", :join_table => "related_products", :foreign_key => "product_id", :association_foreign_key => "related_product_id"
  has_and_belongs_to_many :grouped_products, :class_name => "Product", :join_table => "grouped_products", :foreign_key => "product_id", :association_foreign_key => "grouped_product_id"
  has_and_belongs_to_many :product_sizes, :class_name => "Product", :join_table => "product_sizes", :foreign_key => "product_id", :association_foreign_key => "product_size_id"
  has_attached_file :image,
    :styles => {
      :thumb=> "100x100#",
      :small  => "240x240>" }
  
  has_attached_file :label,
    :styles => {
      :thumb=> "100x100#",
      :small  => "300x300>" }
      
  has_attached_file :download

  default_scope :order => 'products.position'

  has_many :producttagorizations
  has_many :metatags, :through => :producttagorizations

  def to_param
    "#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def self.search(search)
    if search
      @group = Group.find(:all)
      find(:all, :conditions => ['@group.name LIKE ?', "%#{search}%"])
    else
      find(:all, :conditions => { :active => "1" })
    end
  end

  def self.searchadmin(page, searchname, searchproductcode, searchcompanyname)
    if searchname or searchproductcode or searchcompanyname
      paginate(:all, :per_page => 30, :page => page, :order => "name ASC", :conditions => ['name LIKE ? and product_code LIKE ? and company_name LIKE ?', "%#{searchname}%","%#{searchproductcode}%","%#{searchcompanyname}%"])
    else
      paginate(:all, :per_page => 30, :page => page, :order => "name ASC")
    end
  end

end
