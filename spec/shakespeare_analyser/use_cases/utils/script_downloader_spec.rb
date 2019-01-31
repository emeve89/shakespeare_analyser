require 'spec_helper'

describe ShakespeareAnalyser::UseCases::Utils::ScriptDownloader do
    describe ".call" do
        it "escapes and parses the url" do
            url = "script_url"
            allow(URI).to receive(:escape).with(url).and_return(url)
            allow(URI).to receive(:parse).with(url).and_return(url)
            allow(Net::HTTP).to receive(:get).and_return("RESPONSE")
            
            result = described_class.call(url: url)
            expect(URI).to have_received(:escape).with(url)
            expect(URI).to have_received(:parse).with(url)
        end

        it "downloads the script", :vcr, cassete_name: "macbeth" do
            url = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"
            result = described_class.call(url: url)
            
            #Check the content of the downloaded script
            parsed = Nokogiri::XML(result)
            expect(parsed.css("TITLE").first.content).to eq "The Tragedy of Macbeth"
            expect(parsed.css("SPEECH").first.at_css("SPEAKER").content).to eq "First Witch"
            expect(parsed.css("SPEECH").first.css("LINE").map(&:content)).to eq(["When shall we three meet again", "In thunder, lightning, or in rain?"])
        end
    end
end