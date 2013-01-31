
require "test_helper"

module Craig

  dom = Helper.dom("personals_casual_encounters.html")
  listings = Page.new(:personals, :casual_encounters, dom).listings

  describe "Craig" do

    it "parses :personals => :casual_encounters" do
      listing = listings[63]

      assert { listing.title == "looking for a real couple - m4mw - 37" }
      assert { listing.location == "abilene" }
      assert { listing.has_image? == false }
      assert { listing.has_map? == false }
      assert { listing.age == 37 }
      assert { listing.seeking == "m4mw" }
      assert { listing.posted_at.strftime("%a %b %-d") == "Tue Jan 22" }
    end

    it "knows when no age is given" do
      listing = listings[74]

      assert { listing.title == "CD - t4m" }
      assert { listing.location == "Abilene" }
      assert { listing.has_image? == false }
      assert { listing.has_map? == false }
      assert { listing.age == 0 }
      assert { listing.seeking == "t4m" }
      assert { listing.posted_at.strftime("%a %b %-d") == "Tue Jan 22" }
    end
  end

end
