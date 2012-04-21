class Link < ActiveRecord::Base
  
  belongs_to :user
  
  validates_presence_of :url, :title

  default_scope order: 'created_at DESC'
  scope :by_user, lambda { |user|
    if user
      where('user_id = :t', t: "#{user.id}")
    else
      all
    end
  }

end
