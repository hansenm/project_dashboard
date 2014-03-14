# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyString"
    manager "MyString"
    organization "MyString"
    is_active true
    is_promoted true
  end
end
