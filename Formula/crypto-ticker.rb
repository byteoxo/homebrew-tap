class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.0/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "eb97850099f265500a57c85ba96eae98b3550dcc507828244267b20446386b01"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.0/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "71a7b64516f9a2c386eb543e6dafa8492525d0f0fbd16ab8ad08852338af464e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.0/crypto-ticker_linux_arm64.tar.gz"
      sha256 "cd12f7826d151768f73fd53e321ea907121cde4ab77b103fb443fe51fb0c344c"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.0/crypto-ticker_linux_amd64.tar.gz"
      sha256 "a1a242ff79eeb74f46fa98df3c7ece35c2cc8d39b4feb8575a8594661e903934"
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
