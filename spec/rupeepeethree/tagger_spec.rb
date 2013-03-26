require './lib/rupeepeethree/tagger'

describe Tagger do
  it "creates a new apic frame if none exist"
  it "clears the tags"  do
    mp3 = './spec/fixtures/test.mp3'
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
