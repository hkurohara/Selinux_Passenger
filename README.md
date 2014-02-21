Selinux_Passenger
=================

This directory contains SELinux module source file for make Phusion Passenger to run on SELinux environment.
To use this, type "make" with root priviledge.

    The version of Passenger : 4.0.29
    Httpd server : apache 2.2.15
    Other : using rvm, using openid module for redmine.

This was constructed just for my environmentm, so may not work on your environment.
For your information, I attach the httpd setting for passenger.

    LoadModule passenger_module /usr/local/rvm/gems/ruby-1.9.3-p484/gems/passenger-4.0.29/buildout/apache2/mod_passenger.so
    PassengerRoot /usr/local/rvm/gems/ruby-1.9.3-p484/gems/passenger-4.0.29
    PassengerDefaultRuby /usr/local/rvm/wrappers/ruby-1.9.3-p484/ruby
    
    # Alias /redmine /var/lib/rails/redmine/public
    
    <VirtualHost *:80>
      # !!! Be sure to point DocumentRoot to 'public'!
      DocumentRoot /var/www/html
      <Directory /var/www/html>
         Allow from all
      </Directory>
      Alias /redmine /var/lib/rails/redmine-2.2.4/public
      <Location /redmine>
        PassengerBaseURI /redmine
        PassengerAppRoot /var/lib/rails/redmine-2.2.4
      </Location>
      <Directory /var/lib/rails/redmine-2.2.4/public>
         # This relaxes Apache security settings.
         # AllowOverride all
         Allow from all
         # MultiViews must be turned off.
         Options -MultiViews
      </Directory>
    </VirtualHost>

