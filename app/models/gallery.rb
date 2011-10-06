class Gallery < ActiveRecord::Base
  belongs_to :page 
  
  default_scope :order => 'position DESC'

  has_attached_file :photo,
    :styles => {
      :original => "600x600>",
      :thumb=> "111x109#",
      :homeimage=> "920x248",
      :small  => "111x140#" }
end
