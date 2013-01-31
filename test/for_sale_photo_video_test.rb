require "test_helper"

module Craig

  dom = Helper.dom("for_sale_photo_video.html")

  describe "Craig" do
    it "parses :for_sale => :photo_video" do
      listings = Page.new(:for_sale, :photo_video, dom).listings
      listing = listings[7]

      assert { listing.title == "Nikon Pocket Wizard set" }
      assert { listing.location == "Abilene, TX" }
      assert { listing.has_image? == true }
      assert { listing.price == 700 }
      deny { listing.respond_to? :bedrooms }
      deny { listing.respond_to? :square_feet }
      assert { listing.has_map? == false }
      assert { listing.posted_at.strftime("%a %b %-d") == "Wed Jan 16" }
      assert { listing.seller == :owner }
    end
  end

end
