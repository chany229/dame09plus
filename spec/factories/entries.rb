# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    body "MyString"
    tags_with_space "秀吉 半兵卫 三成 信忠"
  end
end
