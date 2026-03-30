class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.6.0/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "2253be0f6427f57be34007e501fd9c0b86b21c59cf1c095be54141a6a396613a"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.6.0/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "8117464dffae4330e2ba8460af70584dff8db5ffe5363e3c8446ea87826f4692"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.6.0/crypto-ticker_linux_arm64.tar.gz"
      sha256 "95b0da855477e62b3916e84ccf4e9f71c04651b51490c84f34a5f44d57e3c94b"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.6.0/crypto-ticker_linux_amd64.tar.gz"
      sha256 "12bbc1fcd74789877e9ee9e56d23b97d3e5f26af22e56fd6d6a90b9fcf9b6db1"
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
