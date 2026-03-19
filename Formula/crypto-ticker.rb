class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.3.1/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "439d0bdb26a966ae1bd9eb55d995272b75ac3395a5cbe554dbd8a253589e73cb"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.3.1/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "e4f88f47e75e8ccb576d5d033c2cd5f370f9f0dc2eecc11620461279c4426eb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.3.1/crypto-ticker_linux_arm64.tar.gz"
      sha256 "450e3987da6884c988009ebf21e0bee145880c5ac9d02b53480c31b2971ae9b3"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.3.1/crypto-ticker_linux_amd64.tar.gz"
      sha256 "ede0bbec3f9bcfdc4e7a87ae2c9e152df7a23f74dcbc477f9b30f991e41150bb"
    end
  end

  def install
    bin.install "crypto-ticker"
    bin.install_symlink "crypto-ticker" => "crypto"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/crypto --help 2>&1", 1)
  end
end
