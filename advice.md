
* Node intuition is good. Read about Data Context Interaction (DCI).
* Add CONRIBUTING file.
* Split large classes into smaller files. Refactor listings.rb to move most of inner classes to their own files. Like housing.rb.
  Aim for each file to be just one public class (or module).
* Testing code has huge blocks with many asserts per block. Try to aim for one assert per method.
* Change the variable name from 'id' to 'uid' or something. 'id' can get quirky in other Ruby/Rails projects.
* Define #to_json and #to_xml for all nodes. You'll make this gem easy to use in toolchains.
* Aim to separate models (biz logic) from your views (presentation). Presenters aka decorators. Look at 'draper' gem.
* Challenge: reword categories.rb and cities.rb to use YAML config file. These are easier for other devs ot change.
* #constantize code has collision risk. Consider inputs ':foo_bar' then ':foo, :bar'. Same output. For your output str, use a separator char such as space, dash, colon, or coma (or two colons if youre turning the constants in ruby classes).
* Your #category_lookup is ripe for a particular pattern. 

    Change code like
    
      'x = y; raise foo unless x; x'

    to:
      
      y or raise 'foo'.

  Also youll be nice to devs if your riase message shows the data taht failed the lookup.
  eg raise "unknown category: #{category}"

* listing_const code needs help. An easy cleanup is to story everything in a recursive hash.
  ie a hash that can contain hashes that can contain hashes.
  init method looks like: supe { |h, k| h[k] = self.new }

* For Node::HasImage and Node::HasMap you could change them to just Node::Image and Node::Map so you can do more than
  just return booleans. Ex: Node::Image could process thumbnails, Node::Map could return Google Map links.

* I'm using the word "Craig" in many different ways. such as gem name, list name, and class name. COnsider changing these to have one name per purpose. For ex waht I think u mean by Craig as a class name is better written as "Site". yes?

* This code {:austin, :housing => :apts_housing } can be clearer and more flexible if you use key-value params like:
  {:city => :austin, :category => :housing => :apts_housing}

* Challenge: cnsider internationalization. Can sq_feet be sq_meters? Can 'cost' have cents? Is the 'date' using a time zone?
* Metaprogramming challenge, rewrite 'include Node::Foo' to 'attr_node :foo'.
  Then upgrade  to do multiple nodes eg "attr_node :foo, goo, :hoo".
      
