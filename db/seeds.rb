# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AppConfig.entries_perpage = 5
AppConfig.notice = "开业大吉"

user = User.create(:username => "六十", :email => "chany229@sina.com", :password => "taiitsu", :password_confirmation => "taiitsu")
user.add_role(:admin)