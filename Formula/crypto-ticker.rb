class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.9.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.2/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "1e3df11e1f3a364e207aa992b7b495ad0009abc73c55502aadbf1542088e4396"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.2/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "05f9011f8239c6e6674a25fda8cfdda6cab74014bee29d823b82616dd53505af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.2/crypto-ticker_linux_arm64.tar.gz"
      sha256 "9f13f5e80d4f055ca8acc7270c94e0933570b000da5e111b26425487c9e7ddd0"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.2/crypto-ticker_linux_amd64.tar.gz"
      sha256 "b7e8224bc4d0e81e780483f297380330cc3fbff41b8f579db1bcd025a532a4cc"
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
