class ConfirmationMailerPreview < ActionMailer::Preview

  def guest_confirmed
    confirmation = Confirmation.first
    ConfirmationMailer.guest_confirmed(confirmation)
  end

  def guest_cancelled
    confirmation = Confirmation.first
    ConfirmationMailer.guest_cancelled(confirmation)
  end

end
