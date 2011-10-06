class ContactMailer < ActionMailer::Base
 
  def contact(author)
    recipients "info@cleverstart.com"
    from       author[:email]
    subject    "Contact Form Response from CleverStart.com"
    body['name']     = author[:name]
    body['company']  = author[:company]
    body['email']    = author[:email]
    body['phone']    = author[:phone]
    body['location']  = author[:location]
    body['message']  = author[:message]
  end
  
  def contactus(author)
    recipients "cservice@strawbridge.net"
    from       "contactform@strawbridge.net"
    subject    "Contact Form Response from StrawBridge.com"
    body['fname']     = author[:fname]
    body['lname']     = author[:lname]
    body['email']  = author[:email]
    body['number']    = author[:number]
    body['address']     = author[:address]
    body['city']  = author[:city]
    body['state']    = author[:state]
    body['zipcode']     = author[:zipcode]
    body['reason']    = author[:reason]
    body['message']     = author[:message]   
    body['school_name']     = author[:school_name]
    body['teacher_name']     = author[:teacher_name]
    body['grade']     = author[:grade]
    body['team_name']     = author[:team_name]
    body['package_information']     = author[:package_information]
    body['parent']     = author[:parent]
  end

end
