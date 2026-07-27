class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.1/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "6d8beeade346fdd48d826f59c6aeae646140b9a95a9a6fb342d0242e9d4eef48"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.1/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "a39f1c46efc4c393b450cf66e153502bfe2747a31d29824dc6584e47ae549ef5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.1/crypto-ticker_linux_arm64.tar.gz"
      sha256 "f17b349de2e5ea9af635b522481e3199b422c590d786efc33ba3e3d464404a65"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.9.1/crypto-ticker_linux_amd64.tar.gz"
      sha256 "95638d28e0d603f18ee5056bd01be737ef371c97be4f843021de3a83b3f46e56"
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
