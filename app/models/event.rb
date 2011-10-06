class Event < ActiveRecord::Base
  def to_param
    "#{id}-#{permalink.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
end
