class FeedbackMailer < ActionMailer::Base

  def feedback_contact(feedback)
    @feedback = feedback
    mail(:to => "wfsneto@gmail.com", :from => feedback.email, :subject => "[Feedback] Gostozinho")
  end
end
