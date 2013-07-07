require 'taglib'
require 'mime/types'

class Tagger
  def self.tag(mp3,tags)
    TagLib::MPEG::File.open(mp3) do |f|
      t = f.id3v2_tag || TagLib::ID3v2::Tag.new
      if tags[:title]
        t.title = tags[:title]
      end
      if tags[:artist]
        t.artist = tags[:artist]
      end
      if tags[:album]
        t.album = tags[:album]
      end
      if tags[:year]
        t.year = tags[:year].to_i
      end
      if tags[:track]
        t.track = tags[:track].to_i
      end
      if tags[:picture]
        image_file = File.expand_path(tags[:picture])
        # delete old frame if it exists
        cover = t.frame_list('APIC').first
        if cover
          t.remove_frame(cover)
        end
        cover = TagLib::ID3v2::AttachedPictureFrame.new
        cover.mime_type = mime_type(image_file)
        cover.type = TagLib::ID3v2::AttachedPictureFrame::FrontCover
        cover.picture = File.open(image_file,"rb"){|f|f.read}
        t.add_frame(cover)
      end
      f.save
    end
  end

  # clear all tags
  def self.clear(mp3)
    TagLib::MPEG::File.open(mp3) do |f|
      f.strip
    end
  end

  def self.print_tags(mp3)
    result = ""
    TagLib::MPEG::File.open(mp3) do |f|
      t = f.id3v2_tag

      result << "title: #{t.title}\n"
      result << "artist: #{t.artist}\n"
      result << "album: #{t.album}\n"
      result << "track number: #{t.track}\n"
      result << "year: #{t.year}\n"

      t.frame_list('APIC').each do |cover|
        result << "image: [#{cover.mime_type}] [#{cover.picture.length} bytes]\n"
      end

      prop = f.audio_properties
      if prop
        result << "Bitrate: #{prop.bitrate}\n"
        result << "Channels: #{prop.channels}\n"
        result << "Sample Rate: #{prop.sample_rate}\n"
        result << "Length: #{sprintf("%.2f", prop.length/60.0)}\n"
      end
    end
    return result
  end

  private
  def self.mime_type(file)
    MIME::Types.type_for(file).to_s
  end
end
