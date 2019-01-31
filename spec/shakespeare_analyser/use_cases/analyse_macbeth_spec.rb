require 'spec_helper'

describe ShakespeareAnalyser::UseCases::AnalyseMacbeth do
    let(:url) { "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml" }
    let(:output) { double("output") }
    let(:analyser) { described_class.new(url: url, output: output) }

    before(:each) do
        allow(ShakespeareAnalyser::UseCases::Utils::ScriptDownloader).to receive(:call)
        allow(ShakespeareAnalyser::UseCases::Utils::ScriptParser).to receive(:call)
        allow(ShakespeareAnalyser::UseCases::Utils::ScriptAnalyser).to receive(:call)
        allow(output).to receive(:call)
    end
    
    it "should receive a url and output as input" do
        expect { described_class.new(url: url, output: output) }.to_not raise_error
        expect { described_class.new }.to raise_error(ArgumentError)
    end

    it "should get the script" do
        analyser.call
        expect(ShakespeareAnalyser::UseCases::Utils::ScriptDownloader).to have_received(:call)
    end

    it "should parse the script" do
        analyser.call
        expect(ShakespeareAnalyser::UseCases::Utils::ScriptParser).to have_received(:call)
    end

    it "should analyse the script" do
        analyser.call
        expect(ShakespeareAnalyser::UseCases::Utils::ScriptAnalyser).to have_received(:call)
    end

    it "should call the presenter" do
        analyser.call
        expect(output).to have_received(:call)
    end
end