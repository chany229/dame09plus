# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Entry do

  describe "1059 tags" do
    let(:entry) { FactoryGirl.create :entry, :tags_with_space => " 秀吉 半兵卫 三成,信忠," }
    it "should return 1059 tags" do
      entry.tags.map(&:name).join(' ').should == "秀吉 半兵卫 三成 信忠"
    end
  end
  
  describe "naruto tags" do
    let(:naruto_entry) { FactoryGirl.create :naruto_entry, :tags_with_space => ",,鹿牙 蛇自 ,卡带     ,,,,63    角飞  , 兜鸢   , ,  " }
    it "should return naruto tags" do
      naruto_entry.tags.map(&:name).join(' ').should == "鹿牙 蛇自 卡带 63 角飞 兜鸢"
    end
  end

end
