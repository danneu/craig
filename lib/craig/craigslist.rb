module Craig

  # Translates our gem's inputs into the request to fetch Craigslist listings.
  class Craigslist
    attr_reader :city, :category, :subcategory

    def initialize(city, categories)
      @city = city
      @category, @subcategory = *Array(categories).flatten
    end

    def listings
      Page.new(category, subcategory, dom).listings
    end

    private

    def dom
      Nokogiri::HTML(open(url))
    end

    # @return [String]
    def url
      "http://#{urlified_city}.craigslist.org/#{urlified_category}"
    end

    def urlified_city
      CITIES[city.to_s] || city.to_s.gsub(/_/, "")
    end

    def urlified_category
      subcategory ? subcategory_lookup : category_lookup["path"]
    end

    def category_lookup
      lookup = CATEGORIES[category.to_s]
      raise UnknownCategoryError, "Unknown category." unless lookup
      lookup
    end

    def subcategory_lookup
      lookup = category_lookup["children"][subcategory.to_s]
      raise UnknownSubcategoryError, "Unknown subcategory." unless lookup
      lookup
    end

  end
end

