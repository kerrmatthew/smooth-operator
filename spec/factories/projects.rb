# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyString"
    owner_id 1
    due_date "2013-01-28"
    start_date "2013-01-28"
    status "MyString"
  end
end
