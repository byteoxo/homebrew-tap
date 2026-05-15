class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.1/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "a10bc9b9b79c72ed7fdd53f0916731027215f48fe51f44d11786eb4b68d1ada8"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.1/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "9ef2fa2e51e72f4e6abb58ca19cd06d82f6bc26d07bca55a11b6fe4e0ed7137e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.1/crypto-ticker_linux_arm64.tar.gz"
      sha256 "44427ddcbaf720d2c108afcb024b0d05f6d8b767377f4908722d34db7e1b146c"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.1/crypto-ticker_linux_amd64.tar.gz"
      sha256 "d500971ff1bf49e16f0ed2f9f4e2e14c433ed6b9c468ebbf030867445661be5a"
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
