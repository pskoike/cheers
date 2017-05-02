class ApplicationMailer < ActionMailer::Base
  default from: 'hi@cheers.com'

  def default_url_options
    ActionMailer::Base.default_url_options.merge(locale: I18n.locale == I18n.default_locale ? nil : I18n.locale)
  end

  layout 'mailer'


end
