module Craig
  require "craig"
  require "minitest/autorun"
  require "wrong/adapters/minitest"
  require "wrong/message/string_comparison"
  require "wrong/message/array_diff"
  require "turn"
  require "pry"
  require "nokogiri"
  include Wrong

  module Helper

    # Parses an html file.
    #
    # @param [String] filename
    # @return Nokogiri dom
    def self.dom(filename)
      pwd = File.expand_path(File.dirname(__FILE__))
      filepath = File.open(File.join(pwd, "sample_html", filename))
      Nokogiri::HTML(filepath)
    end
  end
end


