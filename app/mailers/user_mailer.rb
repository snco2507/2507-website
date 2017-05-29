class UserMailer < ApplicationMailer
	default from: 'contact@bicester-atc.co.uk'
 
  def contact_email(name, email, subject, message)
    @name = name
    @email = email
    @subject = subject
    @message = message

    @blah = "Helloblah"

    @url  = 'http://bicester-atc.co.uk/contact'
    mail(to: 'snco.2507@aircadets.org', subject: 'Contact request')
  end
end
