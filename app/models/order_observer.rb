class OrderObserver < ActiveRecord::Observer
  observe :OrderTransaction

  def after_save(transaction)
  OrderMailer.deliver_confirmation(transaction)
  end
  
 end