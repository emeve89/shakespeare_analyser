require 'spec_helper'

describe ShakespeareAnalyser::UseCases::Utils::ScriptParser do
    describe ".call" do
        let(:data) {
            "<?xml version=\"1.0\"?>\n<!DOCTYPE PLAY SYSTEM \"play.dtd\">\n\n<PLAY>\n<TITLE>The Tragedy of Macbeth</TITLE>\n\n<FM>\n<P>Text placed in the public domain by Moby Lexical Tools, 1992.</P>\n<P>SGML markup by Jon Bosak, 1992-1994.</P>\n<P>XML version by Jon Bosak, 1996-1998.</P>\n<P>This work may be freely copied and distributed worldwide.</P>\n</FM>\n\n\n<PERSONAE>\n<TITLE>Dramatis Personae</TITLE>\n\n<PERSONA>DUNCAN, king of Scotland.</PERSONA>\n\n<PGROUP>\n<PERSONA>MALCOLM</PERSONA>\n<PERSONA>DONALBAIN</PERSONA>\n<GRPDESCR>his sons.</GRPDESCR>\n</PGROUP>\n\n\n<PGROUP>\n<PERSONA>MACBETH</PERSONA>\n<PERSONA>BANQUO</PERSONA>\n<GRPDESCR>generals of the king's army.</GRPDESCR>\n</PGROUP>\n\n\n<PGROUP>\n<PERSONA>MACDUFF</PERSONA>\n<PERSONA>LENNOX</PERSONA>\n<PERSONA>ROSS</PERSONA>\n<PERSONA>MENTEITH</PERSONA>\n<PERSONA>ANGUS</PERSONA>\n<PERSONA>CAITHNESS</PERSONA>\n<GRPDESCR>noblemen of Scotland.</GRPDESCR>\n</PGROUP>\n\n<PERSONA>FLEANCE, son to Banquo.</PERSONA>\n<PERSONA>SIWARD, Earl of Northumberland, general of the English forces.</PERSONA>\n<PERSONA>YOUNG SIWARD, his son.</PERSONA>\n<PERSONA>SEYTON, an officer attending on Macbeth.</PERSONA>\n<PERSONA>Boy, son to Macduff. </PERSONA>\n<PERSONA>An English Doctor. </PERSONA>\n<PERSONA>A Scotch Doctor. </PERSONA>\n<PERSONA>A Soldier.</PERSONA>\n<PERSONA>A Porter.</PERSONA>\n<PERSONA>An Old Man.</PERSONA>\n<PERSONA>LADY MACBETH</PERSONA>\n<PERSONA>LADY MACDUFF</PERSONA>\n<PERSONA>Gentlewoman attending on Lady Macbeth. </PERSONA>\n<PERSONA>HECATE</PERSONA>\n<PERSONA>Three Witches.</PERSONA>\n<PERSONA>Apparitions.</PERSONA>\n<PERSONA>Lords, Gentlemen, Officers, Soldiers, Murderers, Attendants, and Messengers. </PERSONA>\n</PERSONAE>\n\n<SCNDESCR>SCENE  Scotland: England.</SCNDESCR>\n\n<PLAYSUBT>MACBETH</PLAYSUBT>\n\n<ACT><TITLE>ACT I</TITLE>\n\n<SCENE><TITLE>SCENE I.  A desert place.</TITLE>\n<STAGEDIR>Thunder and lightning. Enter three Witches</STAGEDIR>\n\n<SPEECH>\n<SPEAKER>First Witch</SPEAKER>\n<LINE>When shall we three meet again</LINE>\n<LINE>In thunder, lightning, or in rain?</LINE>\n</SPEECH>\n\n<SPEECH>\n<SPEAKER>Second Witch</SPEAKER>\n<LINE>When the hurlyburly's done,</LINE>\n<LINE>When the battle's lost and won.</LINE>\n</SCENE></ACT></PLAY>"
        }

        it "parses the xml" do
            result = described_class.call(data: data)
            expect(result).to be_instance_of(Nokogiri::XML::NodeSet)
        end

        it "returns the speeches" do
            result = described_class.call(data: data)
            expect(result.count).to eq 2 # Number of speeches in data
        end
    end
end