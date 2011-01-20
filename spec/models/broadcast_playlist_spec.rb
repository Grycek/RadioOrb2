require File.dirname(__FILE__) + '/../spec_helper'

describe BroadcastPlaylist do
  it "should be valid" do
    BroadcastPlaylist.new.should be_valid
  end
end
