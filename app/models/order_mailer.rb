class OrderMailer < ActionMailer::Base
  
   def confirmation(transaction)
   @recipients  = transaction.order.user.email
   @from        = "webmaster@fdnhhealth.com"
   @subject     = 'Your order from fdnhhealth.com.'
   @sent_on     = Time.now
   @body[:transaction] = transaction
 end
 
 end