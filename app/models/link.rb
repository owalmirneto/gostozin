class Link < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :url, :title
  validates_format_of :url, :with => URI::regexp(%w(http https))

  default_scope order: 'created_at DESC'

  scope :search, lambda { |search|
    where("title LIKE :s OR url LIKE :s OR description LIKE :s OR tags LIKE :s", :s => "%#{search}%")
  }

  scope :by_user, lambda { |user|
    where("user_id =  :id", :id => "%#{user.id}%")
  }
end
