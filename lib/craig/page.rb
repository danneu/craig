module Craig

  # Represents a page of listings.
  class Page
    attr_reader :category, :subcategory, :dom

    def initialize(category, subcategory, dom)
      @category = category
      @subcategory = subcategory
      @dom = dom
    end

    # @return [Array<Craig::Listing>]
    def listings
      dom.css("#toc_rows .row").map do |node|
        listing_const.new(node)
      end
    end

    private

    # Returns the most specific Listing for the category and subcategory.
    # If Listing::CategorySubcategory doesn't exist, try Listing::Category.
    # If that doesn't exist, fall back to Listing::Base
    #
    # @return [Craig::Listing]
    def listing_const
      category_const =  constantize(category)
      subcategory_const = constantize(subcategory)
      if Listing.const_defined?(category_const)
        category_const_path = eval("Craig::Listing::#{category_const}")
        if subcategory && category_const_path.const_defined?(subcategory_const)
          return eval("Craig::Listing::#{category_const}::#{subcategory_const}")
        end
        return category_const_path
      end
      Craig::Listing::Base
    end

    # Converts the category and subcategory into their constant forms.
    #
    #    :for_sale => "ForSale"
    #    :for_sale, :cars_trucks => "ForSaleCarsTrucks"
    #
    # @return [String]
    def constantize(*symbols)
      symbols.flat_map {|s| s.to_s.split("_") }.map(&:capitalize).join("").to_s
    end
  end
end
