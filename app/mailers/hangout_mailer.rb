class HangoutMailer < ApplicationMailer
  def creation_confirmation(hangout)
    @hangout = hangout
    @user = hangout.user
    mail(
      to:       @hangout.user.email,
      subject:  "hangout #{@hangout.title} created!"
    )
  end

   def vote_starting(hangout)
    @hangout = hangout
    @owner = hangout.user

    @hangout.confirmations.each do |confirmation|
      @user = confirmation.user
      mail(
        to:       @confirmation.user.email,
        subject:  "#{@hangout.title}: 1, 2 ,3 Vote!"
      )
    end
  end

end
