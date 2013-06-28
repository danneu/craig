require "test_helper"

class TestListing
  include Craig::Node::Location
end

describe "location" do

  context "when given" do
    text = "(Austin)"
    html = "<div><span class='itempn'>#{text}</span></div>"
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "parses the correct location" do
      assert { listing.location == "Austin" }
    end
  end

  context "when extra whitespace" do
    it "strips the trims whitespace" do
      text = "( new york  city  )"
      html = "<div><span class='itempn'>#{text}</span></div>"
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      assert { listing.location == "new york city" }
    end
  end

  context "when none given" do
    it "is empty string" do
      text = "()"
      html = "<div><span class='itempn'>#{text}</span></div>"
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      assert { listing.location == "" }
    end
  end

end

