
require "test_helper"

class TestListing
  include Craig::Node::HasImage
end

describe "image" do
  context "when given" do
    it "parses 'pic'" do
      html = <<-HTML
      <div>
      <span class="itempx">pic</span>
      </div>
      HTML
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      assert { listing.has_image? }
    end

    it "parses 'img'" do
      html = <<-HTML
      <div>
      <span class="itempx">img</span>
      </div>
      HTML
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      assert { listing.has_image? }
    end
  end

  context "when missing from node" do
    it "is false" do
      html = <<-HTML
      <div>
      <span class="itempx"></span>
      </div>
      HTML
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      deny { listing.has_image? }
    end
  end

  context "when node is missing" do
    it "is false" do
      html = <<-HTML
      <div>
      </div>
      HTML
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      deny { listing.has_image? }
    end
  end
end


