Factory.define :user do |f| 
  f.first_name "Foo"
  f.surname "Bar"
  f.sequence(:email) { |n| "foo#{n}@example.com"}
  # f.email "foo1@example.com"
  f.password "secret"
  f.description "I am a rainmaker"
  f.birthday Date.today
end

Factory.define :member do |f| 
  f.name "Foo"
  f.sequence(:email) { |n| "foo#{n}@example.com"}
  # f.email "foo1@example.com"
  f.password "secret"
  f.description "I am a rainmaker"
  f.address_1 "St. Mary's Mansions"
  f.address_2 "St. Mary's Terrace"
  f.city "London"
  f.post_code "000000"
end