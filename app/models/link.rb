class Link < ActiveRecord::Base
  
  belongs_to :user
  
  validates_presence_of :url, :title

  default_scope order: 'created_at DESC'
  scope :by_user, lambda { |terms|
    where('user_id = :t', t: "#{terms}")
  }

end
