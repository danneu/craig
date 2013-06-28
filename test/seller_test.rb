require "test_helper"

class TestListing
  include Craig::Node::Seller
end

describe "seller" do

  context "when given" do

    it "parses owner" do
      html = <<-HTML
      <div>
      <span class="gc">stuff - by owner</span>
      </div>
      HTML
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      assert { listing.seller == :owner }
    end

    it "parses dealer" do
      html = <<-HTML
      <div>
      <span class="gc">stuff - by dealer</span>
      </div>
      HTML
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      assert { listing.seller == :dealer }
    end
  end

  context "when missing from node" do
    html = <<-HTML
    <div>
    <span class="gc"></span>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "is nil" do
      assert { listing.seller.nil? }
    end
  end

  context "when node is missing" do
    html = <<-HTML
    <div>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "is nil" do
      assert { listing.seller.nil? }
    end
  end

end
