module Craig
  module Node

    # @return [Array] all methods defined by Nodes
    def self.all_methods
      Craig::Node.module_eval {
        constants.map { |c| const_get c }
      }.flat_map(&:instance_methods)
    end

    module Title
      # @return [String]
      def title
        dom.at_css("a").text.gsub(/\s+/, " ").strip
      end
    end

    module PostedAt
      # @return [Date]
      def posted_at
        current = dom
        while current = current.previous_element
          return Date.parse(current) if current.name == "h4"
        end
      end
    end

    module Location
      # @return [String]
      def location
        node = dom.at_css(".itempn")
        return "" unless node
        text = node.text.strip[1..-2].to_s
        text ? text.strip : text
      end
    end

    module HasImage
      # The listing includes a pic/image.
      #
      # @return [Boolean]
      def has_image?
        !!dom.at_css(".itempx").text[/(img|pic)/]
      end
    end

    module Url
      # @return [String]
      def url
        dom.at_css("a")[:href]
      end
    end

    module Id
      # The unique ID of the listing.
      #
      # @return [String]
      def id
        dom.at_css("a")[:href][/\d+(?=\.html)/].to_i
      end
    end

    module HasMap
      # The listing includes a map.
      #
      # @return [Boolean]
      def has_map?
        !!dom.at_css(".itempx").text[/map/]
      end
    end

    module Age
      # The poster's age. Coerced to 0 if it is missing so that listings can be
      # sorted.
      #
      # @return [Int]
      def age
        dom.at_css("a").text[/- (\d+)$/, 1].to_i
      end
    end

    module Seeking
      # @return [String]
      def seeking
        dom.at_css("a").text[/- ([a-zA-Z]+4[a-zA-Z]+)/, 1]
      end
    end

    module Seller
      # @return [:dealer, :owner]
      def seller
        node = dom.at_css(".gc")
        return nil unless node
        node.text[/(dealer|owner)/].to_sym
      end
    end

    # If there is no date range, then ends_at == starts_at.
    module StartsAndEndsAt
      # @return [Date]
      def starts_at
        starts_at, _ = itemdates
        Date.parse(starts_at)
      end

      # @return [Date]
      def ends_at
        _, ends_at = itemdates
        Date.parse(ends_at)
      end

      private

      def itemdates
        arr = dom.at_css(".itemdate").text.split("-")
        (arr.count == 2) ? (arr) : (arr * 2)
      end
    end

    module SquareFeet
      # @return [Int] area
      def square_feet
        node = dom.at_css(".itemph")
        return nil unless node
        node.text[/\d+(?=ft)/].to_i
      end
    end

    module Bedrooms
      # @return [Int] number of bedrooms
      def bedrooms
        node = dom.at_css(".itemph")
        return nil unless node
        node.text[/\d+(?=br)/].to_i
      end
    end

    module Price
      # Price coerced to 0 if missing.
      #
      # @return [Int] price
      def price
        dom.elements
          .reverse
          .map(&:text)
          .join("")[/(\$)(\d+)/, 2]
          .to_i
      end
    end
  end
end
