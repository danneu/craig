require "test_helper"

class TestListing
  include Craig::Node::PostedAt
end

describe "posted at" do

  context "when in banner" do
    html = <<-HTML
    <h4>24 Jan 2013</h4>
    <div></div>
    <div></div>
    HTML
    dom = Nokogiri::HTML(html)
    last_row = dom.css("div").last
    listing = TestListing.new(last_row)

    it "is gets date from banner" do
      assert { listing.posted_at == Date.parse("24 Jan 2013") }
    end
  end

  context "when in row" do
    html = <<-HTML
    <div><span class="itemdate">Jan 24</span></div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    it "parses" do
      assert { listing.posted_at == Date.parse("24 Jan 2013") }
    end
  end

end

