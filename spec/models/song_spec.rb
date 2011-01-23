require File.dirname(__FILE__) + '/../spec_helper'

describe Song do
  it "should be valid" do
    Song.new.should be_valid
  end
end
