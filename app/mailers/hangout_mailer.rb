class HangoutMailer < ApplicationMailer
  def creation_confirmation(hangout)
    @hangout = hangout

    mail(
      to:       @hangout.user.email,
      subject:  "hangout #{@hangout.title} created!"
    )
  end
end
