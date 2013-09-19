require "test_helper"

class TestListing
  include Craig::Node::Url
end

describe "url" do
  it "works" do
    html = <<-HTML
    <div>
    <a href="http://example.com">Example</a>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    assert { listing.url == "http://example.com" }
  end
end


