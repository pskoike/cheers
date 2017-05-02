class HangoutMailer < ApplicationMailer

  def creation_confirmation(hangout)
    @hangout = hangout
    @user = hangout.user
    mail(
      to:       @hangout.user.email,
      subject: default_i18n_subject(hangout_title: @hangout.title)
    )
  end

  def update_confirmation(hangout)
    @hangout = hangout
    @user = hangout.user
    mail(
      to:       @hangout.user.email,
      subject: default_i18n_subject(hangout_title: @hangout.title)
    )
  end

  def vote_starting(confirmation)
    @confirmation = confirmation
    @hangout = @confirmation.hangout
    @guest = @confirmation.user
    @owner = @hangout.user
      mail(
        to:       @guest.email,
        subject:  default_i18n_subject(hangout_title: @hangout.title)
      )
  end

  def hangout_update(confirmation)
    @confirmation = confirmation
    @hangout = @confirmation.hangout
    @guest = @confirmation.user
    @owner = @hangout.user

      mail(
        to:       @guest.email,
        subject:  default_i18n_subject(host_name: @owner.first_name, hangout_title: @hangout.title)
      )
  end

  def cancelled(confirmation)
    @confirmation = confirmation
    @hangout = @confirmation.hangout
    @guest = @confirmation.user
    @owner = @hangout.user

      mail(
        to:       @guest.email,
        subject:  default_i18n_subject(hangout_title: @hangout.title)
      )
  end

  def result(confirmation)
    @confirmation = confirmation
    @hangout = @confirmation.hangout
    @place = @hangout.place
    @guest = @confirmation.user
    @owner = @hangout.user

      mail(
        to:       @guest.email,
        subject:  default_i18n_subject(hangout_title: @hangout.title)
      )
  end


end
