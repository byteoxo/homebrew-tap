class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.8.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.2/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "609d65677c95952b2bbb61a23f9dbf9e4fc1989914715fa16ea24f6e466b217d"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.2/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "d322c81499b76c4092f3c8fdbec553e4172c81deef8d08c56365176618916985"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.2/crypto-ticker_linux_arm64.tar.gz"
      sha256 "9b80a42d3be70cd6c0a5f6885e3394e75c322912dabffe3c3de70555bbf9a309"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.2/crypto-ticker_linux_amd64.tar.gz"
      sha256 "c9c605737f288559d564895e8ef0512371ad5036259fba42c188f1257d6a3bf6"
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
