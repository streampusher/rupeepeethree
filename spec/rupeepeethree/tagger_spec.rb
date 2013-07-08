require './lib/rupeepeethree/tagger'

describe Tagger do
  let(:mp3) { 'spec/fixtures/test.mp3' }
  before :each do
    Tagger.clear(mp3)
  end
  it "edits the existing cover art frame instead of creating a new one" do
    tags = {picture: "spec/fixtures/cover_art.jpg"}
    image_string = /image: \[image\/jpeg\] \[59562 bytes\]\n/
    Tagger.tag(mp3, tags)
    result = Tagger.print_tags(mp3)
    result.should match(image_string)

    Tagger.tag(mp3, tags)
    result = Tagger.print_tags(mp3)
    result.should_not match(/#{image_string}{2}/)
  end
  it "clears the tags"  do
    tags = {title: "foodfight",
            artist: "ninjaturtle",
            album: "purplerain",
            year: "1987",
            picture: "spec/fixtures/cover_art.jpg"}
    Tagger.tag(mp3, tags)
    Tagger.clear(mp3)
    result = Tagger.print_tags(mp3)
    result.should match(/title: \n/)
    result.should match(/artist: \n/)
    result.should match(/album: \n/)
    result.should match(/year: 0\n/)
    result.should_not match(/image:/)
  end
end
