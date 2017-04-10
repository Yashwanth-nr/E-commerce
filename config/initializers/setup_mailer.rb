ActionMailer::Base.smtp_settings = { 

   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => "plain",
   :enable_starttls_auto => true,
   :user_name => "yashwanth.nr@gmail.com",
   :password => "9964581414",
   :openssl_verify_mode  => 'none'
   
}