require "rupeepeethree"
require "cocaine"

describe Rupeepeethree do
  before :all do
    @rp3 = "ruby -Ilib bin/rp3"
  end
  before :each do
    # clear tags
    line = Cocaine::CommandLine.new(@rp3, "-c :mp3")
    line.run(mp3: "spec/fixtures/test.mp3")
  end
  it "sets a title tag" do
    line = Cocaine::CommandLine.new(@rp3, "-t :title :mp3")
    result = line.run(title: "foodfight", mp3: "spec/fixtures/test.mp3")
    result.should match(/foodfight/)
  end
  it "sets an artist tag" do
    line = Cocaine::CommandLine.new(@rp3, "-a :artist :mp3")
    result = line.run(artist: "ninjaturtle", mp3: "spec/fixtures/test.mp3")
    result.should match(/ninjaturtle/)
  end
  it "sets an album tag" do
    line = Cocaine::CommandLine.new(@rp3, "-A :album :mp3")
    result = line.run(album: "purplerain", mp3: "spec/fixtures/test.mp3")
    result.should match(/purplerain/) 
  end
  it "sets a year tag" do
    line = Cocaine::CommandLine.new(@rp3, "-Y :year :mp3")
    result = line.run(year: "1987", mp3: "spec/fixtures/test.mp3")
    result.should match(/1987/) 
  end
  it "sets album art tag" do
    line = Cocaine::CommandLine.new(@rp3, "-p :pic :mp3")
    result = line.run(pic: "spec/fixtures/cover_art.jpg", mp3: "spec/fixtures/test.mp3")
    result.should match(/image\/jpeg/) 
    result.should match(/59562 bytes/)
  end
end
