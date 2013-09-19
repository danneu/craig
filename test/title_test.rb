
require "test_helper"

class TestListing
  include Craig::Node::Title
end

describe "title" do

  it "is parsed" do
    html = <<-HTML
    <div>
    <a href="">My Title</a>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    assert { listing.title == "My Title" }
  end

  it "handles whitespace" do
    html = <<-HTML
    <div>
    <a href="">  My   Title   -</a>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    assert { listing.title == "My Title -" }
  end

  it "slurps up everything" do
    html = <<-HTML
    <div>
    <a href="">My Title - w4m - 24 - $88888</a>
    </div>
    HTML
    dom = Nokogiri::HTML(html)
    listing = TestListing.new(dom)

    assert { listing.title == "My Title - w4m - 24 - $88888" }
  end

end
