Given /^a logged in with email "([^"]*)"$/ do |email|
  u = Factory.create(:user, :email => email)
  visit(new_user_session_path)
  fill_in("user[email]", :with => email)
  fill_in("user[password]", :with => u.password)
  click_button('Sign in')
end

Given /^a logged in admin user$/ do
  u = Factory.create(:admin)
  visit(new_user_session_path)
  fill_in("user[email]", :with => "admin@admin.pl")
  fill_in("user[password]", :with => "adminpass")
  click_button('Sign in')
end

Given /^active broadcast called "([^"]*)"$/ do |broadcast_name|
  u = Factory.create(:broadcast, :name => broadcast_name)
end

Given /^inactive broadcast called "([^"]*)"$/ do |broadcast_name|
  u = Factory.create(:broadcast, :name => broadcast_name, :is_active => false)
end
