require 'test_helper'
require 'generators/ascent/ascent_generator'

class AscentGeneratorTest < Rails::Generators::TestCase
  tests AscentGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
