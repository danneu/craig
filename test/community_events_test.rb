require "test_helper"

module Craig

  describe ":community => :events" do

    describe "one page" do
      one_page = Helper.dom("community_events-one-page.html")
      listings = Page.new(:community, :events, one_page).listings

      describe "multi-day event" do
        it "parses" do
          listing = listings.first

          assert { listing.title ==
            "Real Estate Courses Online -- 15% Off!!" }
          assert { listing.location == "Texas" }
          assert { listing.has_image? == false }
          assert { listing.has_map? == false }
          deny { listing.respond_to? :price }
          deny { listing.respond_to? :bedrooms }
          deny { listing.respond_to? :square_feet }
          deny { listing.respond_to? :posted_at }
          deny { listing.respond_to? :seller }
          assert { listing.starts_at.strftime("%b %-d") ==
            "Jan 8" }
          assert { listing.ends_at.strftime("%b %-d") ==
            "Jan 22" }
        end
      end

      describe "one-day event" do
        it "parses" do
          listing = listings[2]

          assert { listing.title ==
            "GED class available" }
          assert { listing.location == "on-line/packet" }
          assert { listing.has_image? == false }
          assert { listing.has_map? == false }
          deny { listing.respond_to? :price }
          deny { listing.respond_to? :bedrooms }
          deny { listing.respond_to? :square_feet }
          deny { listing.respond_to? :posted_at }
          deny { listing.respond_to? :seller }
          assert { listing.starts_at.strftime("%b %-d") ==
            "Jan 25" }
          assert { listing.ends_at.strftime("%b %-d") ==
            "Jan 25" }
        end
      end

    end
  end

end
