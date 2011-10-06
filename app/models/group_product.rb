class GroupProduct < ActiveRecord::Base
  belongs_to :article
  belongs_to :metatag
end
