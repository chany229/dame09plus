# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Entry do

  describe "1059 tags" do
    let(:entry) { FactoryGirl.create :entry, :tags_with_space => " 秀吉 半兵卫 三成,信忠," }
    it "should return 1059 tags" do
      entry.tags.map(&:name).join(' ').should == "秀吉 半兵卫 三成 信忠"
    end
    pending "正确返回战国条目信息 #{__FILE__}"
  end
  
  describe "naruto tags" do
    let(:naruto_entry) { FactoryGirl.create :naruto_entry, :tags_with_space => ",,鹿牙 蛇自 ,卡带     ,,,,63    角飞  , 兜鸢   , ,  " }
    it "should return naruto tags" do
      naruto_entry.tags.map(&:name).join(' ').should == "鹿牙 蛇自 卡带 63 角飞 兜鸢"
    end
    pending "正确返回火影条目信息 #{__FILE__}"
  end
  
  describe "hiyori body" do
    let(:hiyori_entry) { FactoryGirl.create :hiyori_entry, :body => "大家的眼睛都死了，搞笑漫画日和" }
    it "should return hiyori body" do
      hiyori_entry.body.should == "大家的眼睛都死了，搞笑漫画日和"
    end
    pending "正确返回日和条目信息 #{__FILE__}"
  end
end
