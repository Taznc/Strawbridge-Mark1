class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  has_one :order

  def total_price
    # convert to array so it doesn't try to do sum on database directly
    line_items.to_a.sum(&:full_price)
  end
  
  def set_sales_tax(user)
     state = user.state
     if(state && (state.downcase=='nc' || state.downcase=='north carolina'))
         if(total_discounts)
          @sales_tax = total_discounts*(0.0775)
         end
     end
     @sales_tax = @sales_tax||0
  end

  def sales_tax
     return @sales_tax || 0
  end 

  def discount
    subtotaldiscount = ""
    case total_price
    when 50..99
      subtotaldiscount = 0.05
    when 100..149
      subtotaldiscount = 0.10
    when 150..199
      subtotaldiscount = 0.15
    when 200..99999
      subtotaldiscount = 0.20
    else
      subtotaldiscount = 0
    end
    return subtotaldiscount
  end

  def nextlevel
    nextbreakamount = ""
    case total_price
    when 0..49
      nextbreakamount = 49
    when 50..99
      nextbreakamount = 99
    when 100..149
      nextbreakamount = 149
    when 150..199
      nextbreakamount = 199
    else
      nextbreakamount = 0
    end
    return nextbreakamount
  end

  def user_discount_percent
     if (user_discount && (user_discount.upcase=='NOHARM10'))
       discount_user = 0.10
     elsif (user_discount && (user_discount.upcase=='CLEVER20'))
       discount_user = 0.20
     elsif
       discount_user = 0.00
     end
     return discount_user
  end

  def total_discounts
    sub_total_price - (sub_total_price * user_discount_percent)
  end

  def sub_total_price
    if discount == 0
      total_price
    else
      total_price - (total_price * discount)
    end
  end
  
  def total_quantity
    # convert to array so it doesn't try to do sum on database directly
    line_items.to_a.sum(&:quantity)
  end
  
  def total_packages
    (total_quantity.to_f / 8).ceil
  end
  
  def shipping_strip
    shipping_choice.gsub(/[^0-9]/,"")
  end
  
  def shipping
    shipping_strip.to_d / 100 * total_packages
  end
  
  def grand_total
    total_discounts + sales_tax + shipping
  end
  
  def paypal_url(return_url, notify_url)
    values = {
      :business => 'robot_1239212209_biz@cleverstart.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url
    }
    line_items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.unit_price,
        "item_name_#{index+1}" => item.product.name,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => item.quantity
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
