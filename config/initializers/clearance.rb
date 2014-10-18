Clearance.configure do |config|
  config.mailer_sender = "noreply@monet.com"
  config.cookie_expiration = lambda {|cookies| 1.day.from_now.utc }
  config.routes = false
end
