# Craig

A robust little Craigslist scraper.

## Installation

Add this line to your application's Gemfile:

    gem 'craig'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install craig

## Usage

    require "craig"

Let's check out some cars within our budget (that have images).
    
    vehicles = Craig.query(:austin, :for_sale => :cars_and_trucks)
    vehicles.select { |v| 
      v.price.between?(6000, 8000) && 
      v.image? &&
      v.seller == :owner 
    }
    
    #=> [<Listing>, <Listing>, <Listing>]
    
I'm about to move to Birmingham. I wonder where the kids my age are living.
    
    listings = Craig.query(:birmingham, :personals => :strictly_platonic)
    listings.select { |p| 
      p.age < 30 && 
    }.map(&:location)
   
    #= ["Highland Ave", "Highland Ave", "Highland Ave"]

Oh wait, I left my trombone downtown last night. I wonder if anyone found it.
    
    listings = Craig.query(:austin, :community => :lost_and_found
    listings.any? { |listing| listing.title =~ /trombone/i }
    
    #=> true

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
