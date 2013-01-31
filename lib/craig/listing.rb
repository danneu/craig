module Craig
  module Listing
    class Base
      attr_reader :dom

      def initialize(dom)
        @dom = dom
      end

      def to_s
        "{\n  " << to_hash.map do |key, value|
          ":#{key} => #{value.inspect}"
        end.join("\n  ") << "\n}"
      end

      def to_hash
        Hash[listing_methods.map {|m| [m, send(m)] }]
      end

      # The available methods for this listing.
      #
      # @return [Array]
      def listing_methods
        (self.class.instance_methods & Node.all_methods)
          .sort.reverse!
      end

      include Node::Title
      include Node::PostedAt
      include Node::Location
      include Node::Url
      include Node::Id
      include Node::HasImage
      include Node::HasMap
    end

    class Community < Base
      class Events < Community
        undef_method :posted_at
        include Node::StartsAndEndsAt
      end
    end

    class Personals < Base
      include Node::Age
      include Node::Seeking
    end

    class Housing < Base
      include Node::SquareFeet
      include Node::Bedrooms
      include Node::Price
    end

    class ForSale < Base
      include Node::Price
      include Node::Seller
    end

    class Services < Base
    end

    class Jobs < Base
    end

    class Gigs < Base
    end

    class Resumes < Base
    end

  end
end
