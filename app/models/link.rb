class Link < ActiveRecord::Base
  
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"

  validates_presence_of :url, :title

  belongs_to :user
end
