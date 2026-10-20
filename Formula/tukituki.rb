# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.17 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.17/tukituki_darwin_arm64.tar.gz"
      sha256 "862775cb7a33c9ba5ba4007ec19dc7d4021332265205132760a5e5aaba0a6bd9"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.17/tukituki_darwin_x86_64.tar.gz"
      sha256 "edd5c3ece3252f319b12b53f1aa51065b39ccea2629ae71e8fb43d99c42285db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.17/tukituki_linux_arm64.tar.gz"
      sha256 "0c07856a81de52e8b821269e2ca1cb002b40f1640701dc1fccc357144bd5d60d"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.17/tukituki_linux_x86_64.tar.gz"
      sha256 "19b83dea01d2f39922e837643db405db2ff339892613aca72dbacbdadc6d1402"
    end
  end

  def install
    bin.install "tukituki"
    bin.install_symlink "tukituki" => "tktk"
  end

  test do
    assert_match "tukituki", shell_output("#{bin}/tukituki version")
    assert_match "tukituki", shell_output("#{bin}/tktk version")
  end
end
