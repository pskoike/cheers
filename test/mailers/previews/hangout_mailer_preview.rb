class HangoutMailerPreview < ActionMailer::Preview
  def creation_confirmation
    hangout = Hangout.first
    HangoutMailer.creation_confirmation(hangout)
  end

  def update_confirmation
    hangout = Hangout.first
    HangoutMailer.update_confirmation(hangout)
  end

  def vote_starting
    confirmation = Confirmation.first
    HangoutMailer.vote_starting(confirmation)
  end

  def hangout_update
    confirmation = Confirmation.first
    HangoutMailer.hangout_update(confirmation)
  end

  def cancelled
    confirmation = Confirmation.first
    HangoutMailer.cancelled(confirmation)
  end

  def result
    confirmation = Confirmation.first
    HangoutMailer.result(confirmation)
  end


end
