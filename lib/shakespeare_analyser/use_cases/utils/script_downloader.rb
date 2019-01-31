require "open-uri"
require "net/http"
require "nokogiri"

module ShakespeareAnalyser
    module UseCases
        module Utils
            class ScriptDownloader
                def self.call(url:)
                    escaped_url = URI.escape(url) 
                    uri = URI.parse(escaped_url)
                    ::Net::HTTP.get(uri)
                end
            end
        end
    end
end