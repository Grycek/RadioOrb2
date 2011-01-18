Factory.define :user do |u|
  u.sequence(:username) { |n| "foo#{n}" }
  u.sequence(:email) { |n| "foo#{n}@example.com" }
  u.password 'funkypass'
  u.password_confirmation {|u| u.password}
  u.is_admin false
end

Factory.define :admin, :class => "User" do |u|
  u.username 'admin'
  u.email 'admin@admin.pl'
  u.password 'adminpass'
  u.password_confirmation {|u| u.password}
  u.is_admin true
end
