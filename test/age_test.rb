require "test_helper"

class TestListing
  include Craig::Node::Age
end

describe "age" do

  context "when given" do
    text = "This is my title - 24"
    html = "<div><a href=''>#{text}</a></div>"
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "is parsed" do
      assert { listing.age == 24 }
    end
  end

  context "when not given" do
    text = "This is my title - "
    html = "<div><a href=''>#{text}</a></div>"
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "is zero" do
      assert { listing.age == 0 }
    end
  end

end
