require 'spec_helper'
require "generator_spec"
require 'generators/ascent/install_generator'

describe Ascent::InstallGenerator, type: :generator do
  destination File.expand_path('../../dummy_app/tmp/generator', __FILE__)
  arguments ['test_admin']

  before do
    prepare_destination
  end

  it 'mount Ascent as Engine in route file and generats all install files' do
    expect_any_instance_of(generator_class).to receive(:route).
      with("mount Ascent::Engine => '/test_admin', as: 'ascent'")
    silence_stream(STDOUT) do
      generator.invoke('install')
    end
    expect(destination_root).to have_structure {
      directory 'config' do
        directory 'initializers' do
          file 'ascent.rb' do
            contains 'Ascent.config'
          end
        end
      end
    } 
  end
end

