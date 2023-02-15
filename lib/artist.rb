require 'pry'
require_relative "./concerns/memorable"
require_relative "./concerns/findable"
require_relative "./concerns/paramable"

class Artist
  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Paramable::InstanceMethods
  
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize
    @@all << self
    @songs = []
  end


  def self.all
    @@all
 end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end
