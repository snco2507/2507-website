class UserMailer < ApplicationMailer
	default from: 'contact@bicester-atc.co.uk'
 
  def contact_email(name, email, subject, message)
    @name = name
    @email = email
    @subject = subject
    @message = message

    @blah = "Helloblah"

    @url  = 'http://bicester-atc.co.uk/contact'
    mail(to: '2507@aircadets.org', bcc: 'snco.2507@aircadets.org',  subject: 'Contact request')
  end

  def report_email(title, location, date, details, attendees)
    @title = title
    @location = location
    @date = date
    @details = details
    @attendees = attendees

    mail(to: '2507@aircadets.org', subject: 'Post Activity Report')
  end
end
