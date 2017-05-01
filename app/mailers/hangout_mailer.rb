class HangoutMailer < ApplicationMailer

  def creation_confirmation(hangout)
    @hangout = hangout
    @user = hangout.user
    mail(
      to:       @hangout.user.email,
      subject:  "Hangout #{@hangout.title} created!"
    )
  end

  def update_confirmation(hangout)
    @hangout = hangout
    @user = hangout.user
    mail(
      to:       @hangout.user.email,
      subject:  "Hangout #{@hangout.title} updated!"
    )
  end

  def vote_starting(confirmation)
    @confirmation = confirmation
    @hangout = @confirmation.hangout
    @guest = @confirmation.user
    @owner = @hangout.user
      mail(
        to:       @guest.email,
        subject:  "#{@hangout.title}: 1, 2 ,3 Vote!"
      )
  end

  def hangout_update(confirmation)
    @confirmation = confirmation
    @hangout = @confirmation.hangout
    @guest = @confirmation.user
    @owner = @hangout.user

      mail(
        to:       @guest.email,
        subject:  "#{@owner} has updated #{@hangout.title}"
      )
  end

  def cancelled(confirmation)
    @confirmation = confirmation
    @hangout = @confirmation.hangout
    @guest = @confirmation.user
    @owner = @hangout.user

      mail(
        to:       @guest.email,
        subject:  "#{@hangout.title} is cancelled..."
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
        subject:  "#{@hangout.title}: And the winner is ???"
      )
  end


end
