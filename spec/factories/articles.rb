# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    entry_body "草帽一味"
    tags "  路飞,,卓洛, ,奈美  , 乌索普,,,山治   乔巴,罗宾,弗兰奇 布鲁克 ,,"
    body "路飞\r\n\r\n\r\n卓洛\r\n奈美            乌索普山治乔巴罗宾弗兰奇布鲁克"
  end
end
