Given /^a logged in with email "([^"]*)"$/ do |email|
  @user = User.find_by_email(email)
  @user = Factory.create(:user, :email => email) unless @user
  visit(new_user_session_path)
  fill_in("user[email]", :with => @user.email)
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
  @presenter = Factory.create(:presenter, :user_id => @user.id, :broadcast_id => @broadcast.id)
end

Then /^I should see "([^"]*)" in the "([^"]*)" input$/ do |content, labeltext|
    find_field("#{labeltext}").value.should == content
end

Then /^I should see(?: within "([^"]*)")? in that order:$/ do |selector, table|
  pattern = table.raw.flatten.collect(&Regexp.method(:quote)).join('.*?')
  regexp = Regexp.compile(pattern, Regexp::MULTILINE)
  with_scope(selector) do
    page.should have_xpath('//*', :text => regexp)
  end
end

Given /^playlist asigned to broadcast(?: with date "([^"]*)")?$/ do |date|
  if date == nil
    @playlist = Factory.create(:broadcast_playlist, :broadcast_id => @broadcast.id)
  else
    @playlist = Factory.create(:broadcast_playlist, :broadcast_id => @broadcast.id, :date => date)
  end
end


Given /^comment asigned to playlist(?: with content "([^"]*)")?$/ do |content|
  if content == nil
    @comment = Factory.create(:comment)
  else
    @comment = Factory.create(:comment, :content => content)
  end
  @comment.user_id = Factory.create(:user)
  @playlist_comment = Factory.create(:playlist_comment, :broadcast_playlist_id => @playlist.id, :comment_id => @comment.id)
end


Given /^comment asigned to playlist and user(?: with content "([^"]*)")?$/ do |content|
  if content == nil
    @comment = Factory.create(:comment)
  else
    @comment = Factory.create(:comment, :content => content)
  end
  @comment.user_id  = @user.id
  @playlist_comment = Factory.create(:playlist_comment, :broadcast_playlist_id => @playlist.id, :comment_id => @comment.id)
end

