module Aws
  module Plugins

    # @seahorse.client.option [Array] :whitelist_headers ([])
    # headers value provided in :whitelist_option will escape
    # blacklis_header check in v4 signer
    class WhitelistHeaders < Seahorse::Client::Plugin

      option(:whitelist_headers, [])

      class Handler < Seahorse::Client::Handler

        def add_handlers(handlers, config)
          handlers.add(Handler, step: :sign)
        end

      end
    end
  end
end
