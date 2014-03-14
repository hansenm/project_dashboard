# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status_report do
    summary "MyText"
    overall "MyString"
    scope "MyString"
    schedule "MyString"
    resources "MyString"
    reported_at "2014-03-14 14:22:34"
    project
  end
end
