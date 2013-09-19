require "test_helper"

class TestListing
  include Craig::Node::Seeking
end

describe "seeking" do

  context "when given" do

    it "is parsed" do
      html = <<-HTML
      <div>
      <a>- w4m</a>
      </div>
      HTML
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      assert { listing.seeking == "w4m" }
    end

    it "handles arbitrary seeking formats" do
      html = <<-HTML
      <div>
      <a>- xyz4lmnop</a>
      </div>
      HTML
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      assert { listing.seeking == "xyz4lmnop" }
    end
  end

  context "when missing" do
    html = <<-HTML
    <div>
    <a></a>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "is nil" do
      assert { listing.seeking.nil? }
    end
  end

end
