class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.3.0/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "9795679862284d49db97868621cca66659c1be4dc04301bca48a78021a02e55c"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.3.0/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "9ccaa8b7c5784e64740b32d05b94292dc7c2c171bfda69e557f11302e176087d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.3.0/crypto-ticker_linux_arm64.tar.gz"
      sha256 "ca4ddf06823b0a63f4b550d664a08435e63e1fe07f40cc27a37a6e0ff5ae1a00"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.3.0/crypto-ticker_linux_amd64.tar.gz"
      sha256 "cbc9688ff38cf317076402ad31045f280bd458228ed3f7044fb5f090305e11b6"
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
