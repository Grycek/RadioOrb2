require File.dirname(__FILE__) + '/../spec_helper'

describe Chart do
  it "should be valid" do
    Chart.new.should be_valid
  end
end
