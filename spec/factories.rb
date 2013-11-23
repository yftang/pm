FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}"}
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :project do
    sequence(:acc) { |n| "Project#{n}" }
    start_date Time.now.to_date
    sequence(:dead_line) { |n| n.days.from_now.to_date}
  end
end
