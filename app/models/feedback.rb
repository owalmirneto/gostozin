class Feedback < ActiveRecord::Base
  after_create :feedback_contact

  validates_presence_of :name
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_presence_of :message

protected
  def feedback_contact
    FeedbackMailer.feedback_contact(self).deliver
  end
end
