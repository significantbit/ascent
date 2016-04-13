require 'spec_helper'
require 'generator_spec'
require 'generators/ascent/install_generator'

describe Ascent::InstallGenerator, type: :generator do
  destination File.expand_path('../../dummy_app/tmp/generator', __FILE__)
  arguments ['test_admin']

  before do
    prepare_destination
  end

  it 'mount Ascent as Engine in route file and generats all install files' do
    expect_any_instance_of(generator_class).to receive(:route)
      .with("mount Ascent::Engine => '/test_admin', as: 'ascent'")

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

    expect(destination_root).to have_structure {
      directory 'db' do
        directory 'migrate' do
          file "#{Time.now.utc.strftime('%Y%m%d%H%M%S')}_ascent_migration.rb" do
            contains 'create_table :node'
            contains 'create_table :node_hierarchies'
            contains 'create_table :node_blocks'
          end
        end
      end
    }
  end
end
