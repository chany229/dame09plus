# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    body "1059"
  end
  
  factory :naruto_entry, :parent => :entry do
    body "naruto"
  end
  
  factory :hiyori_entry, class: Entry do
    tags_with_space "  奥之细道,, 飞鸟  天国,"
  end
end
