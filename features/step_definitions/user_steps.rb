Given /^a logged in with email "([^"]*)"$/ do |email|
  @user = Factory.create(:user, :email => email)
  visit(new_user_session_path)
  fill_in("user[email]", :with => email)
  fill_in("user[password]", :with => @user.password)
  click_button('Sign in')
end

Given /^a logged in admin user$/ do
  @user = Factory.create(:admin)
  visit(new_user_session_path)
  fill_in("user[email]", :with => "admin@admin.pl")
  fill_in("user[password]", :with => "adminpass")
  click_button('Sign in')
end

Given /^active broadcast called "([^"]*)"$/ do |broadcast_name|
  @broadcast = Factory.create(:broadcast, :name => broadcast_name)
end

Given /^inactive broadcast called "([^"]*)"$/ do |broadcast_name|
  @broadcast = Factory.create(:broadcast, :name => broadcast_name, :is_active => false)
end

Given /^asigned user to broadcast$/ do
  @presenter = Factory.create(:presenter, :user_id => @user, :broadcast_id => @broadcast)
end
