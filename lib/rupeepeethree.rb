# encoding: utf-8
require 'rupeepeethree/tagger'
require 'rupeepeethree/version'
require 'optimist'

module Rupeepeethree
  class Cli
    def self.run(args)
      p = Optimist::Parser.new do
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
        opt :track, "track number", type: String, short: 'n'
        opt :album, "album title", type: String, short: 'A'
        opt :picture, "artwork", type: String, short: 'p'
        opt :clear, "clear all tags!"
      end

      opts = Optimist::with_standard_exception_handling p do
        raise Optimist::HelpNeeded if ARGV.empty? # show help screen
        p.parse ARGV
      end

      mp3s = ARGV
      if mp3s.empty?
        abort("no mp3 specified...")
      end
      mp3s.each do |mp3|
        if opts[:clear]
          Tagger.clear(mp3)
        else
          Tagger.tag(mp3,opts)
          puts Tagger.print_tags(mp3)
        end
      end
    end
  end
end
