# encoding: utf-8
require 'rupeepeethree/tagger'
require 'rupeepeethree/version'
require 'trollop'

class Rupeepeethree
  def self.run(args)
    p = Trollop::Parser.new do
      version "RP3 version #{VERSION} by Tony Miller"
      banner <<-EOS
░█▀▄░█▀█░▀▀█
░█▀▄░█▀▀░░▀▄
░▀░▀░▀░░░▀▀░
┣¨ｷ┣¨ｷ
You thought your mp3s were cool. Turns out you were wrong. Your mp3s have no tags. You must tag them!
      EOS
      opt :title, "title", type: String, short: 't'
      opt :artist, "artist", type: String, short: 'a'
      opt :year, "track year", type: String, short: 'Y'
      opt :album, "album title", type: String, short: 'A'
      opt :picture, "artwork", type: String, short: 'p'
    end

    opts = Trollop::with_standard_exception_handling p do
      raise Trollop::HelpNeeded if ARGV.empty? # show help screen
      p.parse ARGV
    end

    mp3 = ARGV[0]
    if mp3.nil?
      abort("no mp3 specified...")
    end
    Tagger.tag(mp3,opts)
    Tagger.print_tags(mp3)
  end
end