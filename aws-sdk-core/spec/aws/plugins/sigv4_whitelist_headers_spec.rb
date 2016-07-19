require 'spec_helper'

module Aws
  module Plugins
    describe WhitelistHeaders do

      let(:plugin) { WhitelistHeaders.new }

      let(:config) { Seahorse::Client::Configuration.new }

      describe 'sigv4 whitelist headers' do

        it 'accepts a sigv4 whitelist headers configuration option' do
          plugin.add_options(config)
          expect(
            config.build!(whitelist_headers: ['foo', 'bar']).whitelist_headers
          ).to eq(['foo', 'bar'])
        end

        it 'defaults the sig4 whitelist headers to an empty array' do
          plugin.add_options(config)
          expect(config.build!.whitelist_headers).to eq([])
        end

      end
    end
  end
end
