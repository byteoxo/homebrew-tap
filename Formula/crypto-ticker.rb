class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.0/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "077cb04be4efb3bd386f8783e09231d4efc9b7412d37ffeeeddd1b291eb67ad9"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.0/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "43b5340ea8662cabf94e96c4d90c210b2029afa4b2e800560d0a0b2c261dccd7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.0/crypto-ticker_linux_arm64.tar.gz"
      sha256 "9bad06f7550cc22377a7d8cbc6bad8f8782288e92d2e274bb6171d7a0cae7526"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.0/crypto-ticker_linux_amd64.tar.gz"
      sha256 "8c7d4682c09afc8bb789034dc8191a83f233a39b475040b90d96deb36a358cb7"
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
