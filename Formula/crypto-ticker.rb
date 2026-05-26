class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.8.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.3/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "f3d09702904e9bfc1d7d9865bd85523d56991d33a7bf5749ee2dad78a602dd80"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.3/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "994ff98ab80a25b1a3e24d0392ebd1f4113b05ccd0f6b3e07e9e73089cdba29b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.3/crypto-ticker_linux_arm64.tar.gz"
      sha256 "86643b94b9a9e799aabae98715b1e69cae2bd4cc6dc12dd1b82e777d13e5c74a"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.8.3/crypto-ticker_linux_amd64.tar.gz"
      sha256 "a8565b5b767a5c6fb73a9aff23215bfee2e28813227615571aaa239a80c37924"
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
