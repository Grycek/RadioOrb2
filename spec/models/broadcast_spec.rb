require File.dirname(__FILE__) + '/../spec_helper'

describe Broadcast do
  it "should be valid" do
    Broadcast.new.should be_valid
  end
end
