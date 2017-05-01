class HangoutMailerPreview < ActionMailer::Preview
  def creation_confirmation
    hangout = Hangout.first
    HangoutMailer.creation_confirmation(hangout)
  end
end
