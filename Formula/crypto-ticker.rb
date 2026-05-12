class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.7.0/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "1748f57f94f9591b7967661861c8afdbcf0fde82890be2ebb49c33356059b1c9"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.7.0/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "2f15f187b02c94494d149b1ac16b2d4543cc977019dd9f0c12e9a6041bd4bce9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.7.0/crypto-ticker_linux_arm64.tar.gz"
      sha256 "23517bf0d4559fa52930702ed57de32dc60fb66a870d5a4164bf5367e1bad827"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.7.0/crypto-ticker_linux_amd64.tar.gz"
      sha256 "63a19c98834d25d2a46063bd52bb96c34abdd196c8394d3502b4961b22349d32"
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
