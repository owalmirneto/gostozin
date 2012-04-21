class Link < ActiveRecord::Base
  
  belongs_to :user
  
  validates_presence_of :url, :title

  default_scope order: 'created_at DESC'

end
