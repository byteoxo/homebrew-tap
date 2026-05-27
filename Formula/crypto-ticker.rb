class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.8.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.4/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "613525c2f4ce9c224e0ed58ec97fe19485ec7d738e8622f0f4608a02404d8eeb"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.4/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "48fe3bbfde02cf80d74a4452dc88012014e136994fa275ae0748fbe424088ed9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.4/crypto-ticker_linux_arm64.tar.gz"
      sha256 "3b29d7cf6634732dec8cf698ad2bceb6fc5a1d80346a8c7f5bb9342040575ca7"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.4/crypto-ticker_linux_amd64.tar.gz"
      sha256 "23fdc152c63ad211c62a38ef1561b62b08c132c07b6a9f20f3673b3f6c1432a1"
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
