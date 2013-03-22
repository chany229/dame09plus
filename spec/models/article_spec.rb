# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Article do
  describe "article" do
    let(:article) { FactoryGirl.create :article }
    
    it "should return op body" do
      article.body.should == "路飞 \n \n \n卓洛 \n奈美 乌索普山治乔巴罗宾弗兰奇布鲁克"
    end
    
    it "should return op entry" do
      article.entry.body.should == "草帽一味"
    end
    
    it "should return op tags" do
      article.entry.tags.map(&:name).join(' ').should == "路飞 卓洛 奈美 乌索普 山治 乔巴 罗宾 弗兰奇 布鲁克"
    end
    
    pending "正确返回海贼王长文信息 #{__FILE__}"
  end
end
