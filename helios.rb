require "formula"

class Helios < Formula
  homepage "https://github.com/spotify/helios"
  url "https://oss.sonatype.org/service/local/repositories/releases/content/com/spotify/helios-tools/0.8.279/helios-tools-0.8.279-shaded.jar"
  sha1 "072461e7256fcbeb2013ded33a4f8eb427b1c9a9"
  version "0.8.279"

  depends_on :java => "1.7+"

  def install
    libexec.install "helios-tools-0.8.279-shaded.jar"
    bin.write_jar_script libexec/"helios-tools-0.8.279-shaded.jar", "helios", "-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"
  end

  test do
    system "#{bin}/helios", "--version"
  end
end
