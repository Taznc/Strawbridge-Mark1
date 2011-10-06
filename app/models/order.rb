class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  has_many :transactions, :class_name => "OrderTransaction"
  
  attr_accessor :card_number, :card_verification
  
  validate_on_create :validate_card
  
  validates_presence_of :first_name, :last_name
  
  has_one :shipping_address, :class_name => "Address", :conditions => "address_type = 'shipping'"
  has_one :billing_address, :class_name => "Address", :conditions => "address_type = 'billing'"
  accepts_nested_attributes_for :shipping_address
  accepts_nested_attributes_for :billing_address
  

  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end
  
  def price_in_cents
    (cart.grand_total*100).round
  end
    
  def total_price
    # convert to array so it doesn't try to do sum on database directly
    cart.line_items.to_a.sum(&:full_price)
  end
  
  def total_quantity
    # convert to array so it doesn't try to do sum on database directly
    cart.line_items.to_a.sum(&:quantity)
  end
  
  private
  
  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => user.first_name + user.last_name,
        :address1 => user.home_address,
        :city     => user.city,
        :state    => user.state,
        :country  => "US",
        :zip      => user.zipcode
      }
    }
  end
  
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end
  
end
