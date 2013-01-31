require "test_helper"
module Craig

  dom = Helper.dom("for_sale_cars_trucks.html")

  describe "Craig" do
    it "parses :for_sale => :cars_trucks" do
      listings = Page.new(:for_sale, :cars_trucks, dom).listings
      listing = listings[1]

      assert { listing.title == "2006 Scion tC Base ABS Brakes-Auxiliary Audio Input-Air Conditioning-Black-4356" }
      assert { listing.location == "www.TXAutoCredit.com" }
      assert { listing.has_image? == true }
      assert { listing.price == 14998 }
      deny { listing.respond_to? :bedrooms }
      deny { listing.respond_to? :square_feet }
      assert { listing.id == 3564981910 }
      assert { listing.has_map? == false }
      assert { listing.url == "http://austin.craigslist.org/ctd/3564981910.html" }
      assert { listing.posted_at.strftime("%a %b %-d") == "Tue Jan 22" }
      assert { listing.seller == :dealer }

      listing = listings[56]
      assert { listing.title == "corvette 77" }
      assert { listing.location == "SAN ANGELO TX" }
      assert { listing.has_image? == true }
      assert { listing.price == 8000 }
      deny { listing.respond_to? :bedrooms }
      deny { listing.respond_to? :square_feet }
      assert { listing.id == 3510301384 }
      assert { listing.has_map? == false }
      assert { listing.url == "http://austin.craigslist.org/cto/3510301384.html" }
      assert { listing.posted_at.strftime("%a %b %-d") == "Tue Jan 22" }
      assert { listing.seller == :owner }
    end
  end

end
