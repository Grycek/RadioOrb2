Given /^a logged in admin user$/ do
  u = Factory.create(:admin)
  visit(new_user_session_path)
  fill_in("user[email]", :with => "admin@admin.pl")
  fill_in("user[password]", :with => "adminpass")
  click_button('Sign in')
end
