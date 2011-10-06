class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at'
end
