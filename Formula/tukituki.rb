# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.18 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tap/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.18/tukituki_darwin_arm64.tar.gz"
      sha256 "7be2e4ea118006cfea5def89642d42bf33420885b63ba9b674df2b0cc98fb047"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.18/tukituki_darwin_x86_64.tar.gz"
      sha256 "8d5beb928409a9be96cbf715ccd2e90be359f58db3c179a5ae04eb49cc1153be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.18/tukituki_linux_arm64.tar.gz"
      sha256 "fe43d242f85674321ce508dce846d295e359b6ad232aa345db5d4e5907f66d07"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.18/tukituki_linux_x86_64.tar.gz"
      sha256 "4b70b5075704b61dfc072500f8c58c1ed716a852aa7c0fb1161c0051db9cedef"
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
