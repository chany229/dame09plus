require 'spec_helper'

describe PublicController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'list'" do
    it "returns http success" do
      get 'list'
      response.should be_success
    end
  end

  describe "GET 'detail'" do
    it "returns http success" do
      get 'detail'
      response.should be_success
    end
  end

end
