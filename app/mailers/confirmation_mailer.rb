class ConfirmationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_mailer.guest_confirmed.subject
  #
  def guest_confirmed(confirmation)
    @confirmation = confirmation
    @hangout = @confirmation.hangout
    @guest = @confirmation.user
    @owner = @hangout.user

      mail(
        to:       @owner.email,
        subject:  "#{@hangout.title}: #{@guest} confirmed!"
      )
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_mailer.guest_cancelled.subject
  #
  def guest_cancelled(confirmation)
    @confirmation = confirmation
    @hangout = @confirmation.hangout
    @guest = @confirmation.user
    @owner = @hangout.user

      mail(
        to:       @owner.email,
        subject:  "#{@hangout.title}: #{@guest} cancelled!"
      )
  end

end
