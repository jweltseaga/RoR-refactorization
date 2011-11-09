class Contact < ActionMailer::Base
  default :from => "Contact-Control@#{host}"

  def parts_order
  	#@user, @key = user, key
    mail( :subject => "#{app_name} -- forgotten password",
          :to      => user.email_address )
  end

  def gen_inquiry
  	#@user, @key = user, key
    mail( :subject => "#{app_name} -- forgotten password",
          :to      => user.email_address )  
  end

  def cust_care
  	#@user, @key = user, key
    mail( :subject => "#{app_name} -- forgotten password",
          :to      => user.email_address )
  end

end
