# Craig

A Craigslist listings scraper.

* Inspired by [gregstallings/craigslist](https://github.com/gregstallings/craigslist).
* A just-for-fun self-educational exercise.

## Installation

    $ gem install craig

## Usage

    require "craig"

Pass in the city and category:

    listings = Craig.query(:austin, :for_sale)

Or narrow down your results with a subcategory:
 
    listings = Craig.query(:austin, :for_sale => :computers)

Returns up to 100 `Listing`s.

## Examples

Let's check out some cars within our budget.
    
    vehicles = Craig.query(:austin, :for_sale => :cars_trucks)
    vehicles.select { |v| 
      v.price.between?(6000, 8000) && 
      v.image? &&
      v.seller == :owner 
    }
    
    #=> [<Listing>, <Listing>, <Listing>]
    
I'm about to move to Birmingham. I wonder where the kids my age are living.
    
    listings = Craig.query(:birmingham, :personals => :strictly_platonic)
    listings.select { |p| 
      p.age < 30
    }.map(&:location)
   
    #= ["Highland Ave", "Highland Ave", "Highland Ave"]

Oh wait, I left my trombone downtown last night. I wonder if anyone found it.
    
    listings = Craig.query(:austin, :community => :lost_found
    listings.any? { |listing| listing.title =~ /trombone/i }
    
    #=> true

Let's get the price of the most expensive Macbook that's sold by an owner 
(instead of a dealer) on or near UT campus.

    Craig.query(:austin, :for_sale => :computer)
      .select { |c| 
        c.seller == :owner && 
        c.location[/campus/i] &&
        c.title[/macbook/i]
      }.sort_by { |c| 
        -c.price 
      }.first

    #=> {
      :url => "http://austin.craigslist.org/sys/3723418912.html"
      :title => "Late 2011 Macbook Pro"
      :seller => :owner
      :price => 1050
      :posted_at => #<Date: 2013-01-23 ((2456316j,0s,0n),+0s,2299161j)>
      :location => "West campus"
      :has_map? => false
      :has_image? => true
      :id => 3723418912
    }

## Available Listing methods

The easiest way to see what listings respond to is to just send them `Listing#to_hash`:

    Craig.query(:new_york_city, :jobs).map(&:to_hash)

Or just look at console output (`Listing#to_s` outputs the hash in string form):

    Craig.query(:new_york_city, :jobs)

Or you can look in `listing.rb` to see the type of nodes that Listings have, then find the method each node defines in `node.rb`.

Since I rarely use Ruby Modules, this gem started out as an self-educational scraper concept where Nodes are composed of Nodes are composed of Nodes but I didn't get very far. So now the internal API is a little spread out. TODO...

## Available cities and categories

The Craigslist website itself serves as documentation for this
gem's API.

* Cities: http://www.craigslist.org/about/sites/
* Categories: http://austin.craigslist.org/

Just downcase Craigslist's name for it and replace spaces and punctuation with underscores.

Here, let me translate some for you to be clear:

<table>
  <tr>
    <th colspan="2">Cities</th>
  </tr>
  <tr>
    <th>How it appears on Craigslist</th><th>The symbol you pass into Craig</th>
  </tr>
  <tr>
    <td>beaumont / port arthur</td>
    <td>:beaumont_port_arthur</td>
  </tr>
  <tr>
    <td>cambridge, UK</td>
    <td>:cambridge_uk</td>
  </tr>
  <tr>
    <td>nice / cote d'azur</td>
    <td>:nice_cote_d_azur</td>
  </tr>
  <tr>
    <th colspan="2">Categories/Subcategories</th>
  </tr>
  <tr>
    <th>How it appears on Craigslist</th><th>The symbol you pass into Craig</th>
  </tr>
  <tr>
    <td>for sale</td>
    <td>:for_sale</td>
  </tr>
  <tr>
    <td>cds/dvd/vhs </td>
    <td>:cds_dvd_vhs</td>
  </tr>
  <tr>
    <td>accounting+finance </td>
    <td>:accounting_finance</td>
  </tr>
</table>

    Craig.query(:nice_cote_d_azur, :for_sale => :cds_dvd_vhs)

If you're still unsure, just check out Craig's internal lookup table.

## Diverges from Craigslist homepage

While I've mostly modeled Craig's API after Craigslist's website, I've 
diverged from the homepage where I felt it made sense. 

For example, I prefer the "Show All" view where possible.

    :community => :events goes to /eee instead of /eve.

    This way you see all events instead of just events with 
    date ranges.

    :for_sale => :cars_trucks goes to the owners+dealers listings

    instead of the splash page that lets you choose
    TODO: Add search API or expose API to specify this stuff.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
