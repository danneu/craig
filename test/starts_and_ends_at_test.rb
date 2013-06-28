require "test_helper"

class TestListing
  include Craig::Node::StartsAndEndsAt
end

describe "starts and ends at" do

  context "when range is given" do
    it "parses a start and end" do
      html = <<-HTML
      <div>
      <span class="itemdate">2/3-2/17: </span>
      </div>
      HTML
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      assert { listing.starts_at == Date.parse("3 Feb 2013") }
      assert { listing.ends_at == Date.parse("17 Feb 2013") }
    end
  end

  context "only start_at is given" do
    it "uses start_at for the end_at" do
      html = <<-HTML
      <div>
      <span class="itemdate">2/3 </span>
      </div>
      HTML
      dom = Nokogiri::HTML(html)
      listing = TestListing.new(dom)

      assert { listing.starts_at == Date.parse("3 Feb 2013") }
      assert { listing.ends_at == Date.parse("3 Feb 2013") }
    end
  end



end


