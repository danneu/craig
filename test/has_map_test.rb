require "test_helper"

class TestListing
  include Craig::Node::HasMap
end

describe "has_map" do
  context "when given" do
    it "works" do
      html = <<-HTML
      <div>
      <span class="itempx">map</span>
      </div>
      HTML
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      assert { listing.has_map? }
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

      assert { listing.has_map? == false }
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

      assert { listing.has_map? == false }
    end
  end
end


