require 'spec_helper'

describe ShakespeareAnalyser::UI::CLIPresenter do
    it "should display the name of character followed by the number of lines spoken" do
        data = {
            "Macbeth" => 23,
            "Duncan" => 14
        }
        expect(STDOUT).to receive(:puts).with('14 Duncan')
        expect(STDOUT).to receive(:puts).with('23 Macbeth')
        described_class.call(data: data)
    end
end