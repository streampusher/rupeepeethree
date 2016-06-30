require './lib/rupeepeethree/tagger'

describe Rupeepeethree::Tagger do
  let(:mp3) { 'spec/fixtures/test.mp3' }
  before :each do
    Rupeepeethree::Tagger.clear(mp3)
  end
  it "edits the existing cover art frame instead of creating a new one" do
    tags = {picture: "spec/fixtures/cover_art.jpg"}
    image_string = /image: \[image\/jpeg\] \[59562 bytes\]\n/
    Rupeepeethree::Tagger.tag(mp3, tags)
    result = Rupeepeethree::Tagger.print_tags(mp3)
    expect(result).to match(image_string)

    Rupeepeethree::Tagger.tag(mp3, tags)
    result = Rupeepeethree::Tagger.print_tags(mp3)
    expect(result).not_to match(/#{image_string}{2}/)
  end
  it "gets a hash of the tags" do
    tags = {title: "foodfight",
            artist: "ninjaturtle",
            album: "purplerain",
            year: "1987",
            picture: "spec/fixtures/cover_art.jpg"}
    Rupeepeethree::Tagger.tag(mp3, tags)
    t = Rupeepeethree::Tagger.tags(mp3)
    expect(t[:title]).to eq("foodfight")
    expect(t[:artist]).to eq("ninjaturtle")
    expect(t[:album]).to eq("purplerain")
    expect(t[:year]).to eq(1987)
  end
  it "clears the tags"  do
    tags = {title: "foodfight",
            artist: "ninjaturtle",
            album: "purplerain",
            year: "1987",
            picture: "spec/fixtures/cover_art.jpg"}
    Rupeepeethree::Tagger.tag(mp3, tags)
    Rupeepeethree::Tagger.clear(mp3)
    result = Rupeepeethree::Tagger.print_tags(mp3)
    expect(result).to match(/title: \n/)
    expect(result).to match(/artist: \n/)
    expect(result).to match(/album: \n/)
    expect(result).to match(/year: 0\n/)
    expect(result).not_to match(/image:/)
  end

  it "returns track length" do
    tags = Rupeepeethree::Tagger.tags(mp3)
    expect(tags[:length]).to eq 2
  end

  it 'blows up if the mp3 file is not found' do
    expect do
      Rupeepeethree::Tagger.tags('not a file')
    end.to raise_exception(Rupeepeethree::Tagger::FileNotFound)

    expect do
      Rupeepeethree::Tagger.tag('not a file', {})
    end.to raise_exception(Rupeepeethree::Tagger::FileNotFound)

    expect do
      Rupeepeethree::Tagger.clear('not a file')
    end.to raise_exception(Rupeepeethree::Tagger::FileNotFound)

    expect do
      Rupeepeethree::Tagger.print_tags('not a file')
    end.to raise_exception(Rupeepeethree::Tagger::FileNotFound)
  end
end
