class Comment < ActiveRecord::Base
  belongs_to :writer, class_name: 'User'
  belongs_to :commentable, polymorphic: true
end
