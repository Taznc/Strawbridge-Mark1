class Producttagorization < ActiveRecord::Base
  belongs_to :product
  belongs_to :metatag
end
