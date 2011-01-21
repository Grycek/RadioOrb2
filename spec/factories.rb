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

Factory.define :broadcast do |t|
    t.name   "Audycja1234"
    t.description     "Opis audycji"
    t.is_active  true
    t.day  0
    t.hour_start "19:38"
    t.hour_end "20:38"
end

Factory.define :presenter do |t|
    t.user_id 0
    t.broadcast_id 0
end


Factory.define :broadcast_playlist do |t|
    t.date "2011-01-12 21:45:00"
    t.description "Probny opis"
    t.playlist "01.Probny utwor\n02. Probny utwor2"
    t.broadcast_id  Factory.build(:broadcast)
end
