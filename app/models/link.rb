class Link < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :url, :title
  validates_format_of :url, :with => URI::regexp(%w(http https))

  default_scope order: 'created_at DESC'
end
