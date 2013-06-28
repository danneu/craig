require "test_helper"

class TestListing
  include Craig::Node::Price
end

describe "price" do

  context "when in arbitrary node" do
    html = <<-HTML
    <div>
    <span>$139 / 3br - 2000ft - </span>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "is parsed" do
      assert { listing.price == 139 }
    end
  end

  context "when title also contains price" do
    html = <<-HTML
    <div>
    <a href="">My title $1000</a>
    <span>$139</span>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "is correct" do
      assert { listing.price == 139 }
    end
  end

  context "when not given" do
    html = <<-HTML
    <div>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "is zero" do
      assert { listing.price == 0 }
    end

  end
end

