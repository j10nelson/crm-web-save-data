# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!

gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-web.sqlite3')

# As soon as we inherit from ActiveRecord::Base, ActiveRecord will also start to consider this class to represent a single database table. That means that every time we create a new Contact record, it will automatically be inserted into the contacts database table.

class Contact < ActiveRecord::Base
  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
Contact.auto_upgrade!
