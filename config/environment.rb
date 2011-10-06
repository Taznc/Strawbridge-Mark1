ENV['RAILS_ENV'] ||= 'production'

RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION
 
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.active_record.observers = :user_observer
  config.active_record.observers = :order_observer
  config.time_zone = 'UTC'
  config.gem 'mime-types', :lib => "mime/types", :version => '1.16'
  
  %w(middleware).each do |dir|
    config.load_paths << "#{RAILS_ROOT}/app/#{dir}"
  end

end


#ActionMailer::Base.default_content_type = "text/html"
#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.smtp_settings = {
#  :address          => "mail.strawbridge.net",
#  :domain           => "strawbridge.net",
#  :port             => 25,
#  :user_name        => "contactform@strawbridge.net",
#  :password         => "Ht3000!",
#  :authentication   => :login
#  } 

ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_charset = "utf-8"
ActionMailer::Base.default_content_type = "text/html"
