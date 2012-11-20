require "language_pack"
require "language_pack/rails3"

# Rails 3 with GPSBabel Language Pack. This is for Ride Journal.
class LanguagePack::Rails3WithGpsbabel < LanguagePack::Rails3
  GPSBABEL_VERSION ="1.4.4"
  GPSBABEL_BINARY = "gpsbabel-#{GPSBABEL_VERSION}"

  # detects is this is a Rails 3.x app with GPSBabel.
  # @return [Boolean] true it it's a Rails 3.x app with GPSBabel.
  def self.use?
    super &&
      File.exists?("config/application.rb") &&
      File.read("config/application.rb") =~ /require <gpsbabel>/
  end

  def binaries
    super + [GPSBABEL_BINARY]
  end
end
