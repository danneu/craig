require "test_helper"

module Craig

  dom = Helper.dom("resumes.html")

  describe "Craig" do
    it "parses :resumes" do
      listings = Page.new(:resumes, nil, dom).listings
      listing = listings[52]

      assert { listing.title == "Female / 28 / Seeking Employment" }
      assert { listing.location == "Sweetwater Texas" }
      assert { listing.has_image? == false }
      deny { listing.respond_to? :price }
      deny { listing.respond_to? :bedrooms }
      deny { listing.respond_to? :square_feet }
      deny { listing.respond_to? :seller }
      assert { listing.has_map? == false }
      assert { listing.posted_at.strftime("%a %b %-d") == "Fri Dec 20" }
    end
  end

end
