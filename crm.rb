# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'

# # Fake data
# Contact.create('Marty', 'McFly', 'marty@mcfly.com', 'CEO')
# Contact.create('George', 'McFly', 'george@mcfly.com', 'Co-Founder')
# Contact.create('Lorraine', 'McFly', 'lorraine@mcfly.com', 'Co-Founder')
# Contact.create('Biff', 'Tannen', 'biff@tannen.com', 'Co-Founder')
# Contact.create('Doc', 'Brown', 'doc@brown.com', 'Co-Founder')

# Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
# Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
# Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')
@@crm_app_name = "Justin's CRM"

get '/' do
  erb :index

end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  @contact = Contact.create(
  first_name: params[:first_name],
  last_name:  params[:last_name],
  email:  params[:email],
  note: params[:note]
  )
redirect to('/contacts')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra: :NotFound
end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:  params[:email],
    note:  params[:note]
)
    redirect to('/')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/')
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
