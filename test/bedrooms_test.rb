require "test_helper"

class TestListing
  include Craig::Node::Bedrooms
end

describe "bedrooms" do
  context "when given" do
    html = <<-HTML
    <div>
    <span class="itemph">$500 / 3br - 1200ft - </span>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "is parsed" do
      assert { listing.bedrooms == 3 }
    end
  end

  context "when missing from node" do
    html = <<-HTML
    <div>
    <span class="itemph">$500</span>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "is 0" do
      assert { listing.bedrooms == 0 }
    end
  end

  context "when node is missing" do
    html = <<-HTML
    <div>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "is 0" do
      assert { listing.bedrooms == 0 }
    end
  end
end
