require File.expand_path('../../config/environment', __FILE__)
require 'simplecov'
SimpleCov.start 'rails' unless ENV['NO_COVERAGE']

require 'rails/test_help'

require 'minitest/reporters'
# Minitest::Reporters.use!
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  # display page contents for debugging purposes
  def display_contents
    contents = @response.body
    puts "\n*********** Form Contents:\n#{contents}\n***********\n"
  end

  # look for some text on page
  def find_text_in_form(e)
    @response.body =~ /#{e}/i ? assert(true) : assert(false, "Couldn't find text: [#{e}]")
  end



end
