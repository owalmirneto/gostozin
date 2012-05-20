class Link < ActiveRecord::Base
  belongs_to :user

  has_many :tags
  
  validates_presence_of :url, :title
  validates_format_of :url, :with => URI::regexp(%w(http https))

  default_scope order: 'created_at DESC'

  scope :search, lambda { |search|
    where("title LIKE :s OR url LIKE :s OR description LIKE :s OR tag_names LIKE :s", :s => "%#{search}%")
  }

  scope :by_tag, lambda { |tag|
    where("tag_names LIKE :tag", :tag => "%#{tag}%")
  }

  scope :by_user, lambda { |user|
    where("user_id =  :id", :id => "%#{user.id}%")
  }
end
