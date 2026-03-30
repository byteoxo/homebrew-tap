class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.5.0/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "694ee6f904ecac62f31561b854dc75083a96eefb52b9b0b246bf0ab92e833c5f"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.5.0/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "a803e77ba250937fc01e217ced18533e85628ca3312113ce8427a6773fea5291"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.5.0/crypto-ticker_linux_arm64.tar.gz"
      sha256 "7e78c3f37f4cc28b75a4ad37fce6172551f53e4495988116a93214238f50478d"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.5.0/crypto-ticker_linux_amd64.tar.gz"
      sha256 "3784d20ddaf99612d35bb776191a618dbd09b3deb76820645d5325b21057d944"
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
