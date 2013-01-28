# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :progress_item_delegate do
    delegator_id 1
    status "MyString"
    active false
  end
end
