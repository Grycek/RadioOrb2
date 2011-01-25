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


Factory.define :comment do |t|
    t.content "Probna zawartosc"
    t.user_id Factory.build(:user)
end


Factory.define :playlist_comment do |t|
    t.broadcast_playlist_id Factory.build(:broadcast_playlist)
    t.comment_id Factory.build(:comment)
end

Factory.define :article do |t|
    t.title "Probny Tytul"
    t.shortcontent "Probny Skrot"
    t.content "Probna tresc"
    t.user_id Factory.build(:user)
    t.start_date Time.now - 7200
    t.end_date Time.now + 7200
end

Factory.define :article_comment do |t|
    t.article_id Factory.build(:article)
    t.comment_id Factory.build(:comment)
end


Factory.define :survey do |t|
    t.question "Random question"
end

Factory.define :survey_question do |t|
    t.sequence(:answer) { |n| "Answer #{n}" }
    t.survey Factory.build(:survey)
end

Factory.define :chart do |t|
    t.number 42
    t.description "Probny opis"
    t.date Time.now
end

Factory.define :song do |t|
    t.sequence(:artist) { |n| "Artist#{n}" }
    t.sequence(:title) { |n| "Title#{n}" }
    t.is_active true
end
