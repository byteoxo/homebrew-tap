class CryptoTicker < Formula
  desc "Terminal-based crypto futures/spot price ticker supporting Binance and Gate.io"
  homepage "https://github.com/byteoxo/crypto-ticker"
  license "MIT"
  version "1.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.4.0/crypto-ticker_darwin_arm64.tar.gz"
      sha256 "c7b342b949dc57d8d12052a4652187ae2044002ac881145b43ded402e2155280"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.4.0/crypto-ticker_darwin_amd64.tar.gz"
      sha256 "e12285bb870a171448ae9c98d424943f0eeb3390a17e08a6f49b741af5ff352f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.4.0/crypto-ticker_linux_arm64.tar.gz"
      sha256 "a9186eda5b0f29560ea840166ddc9e5bc52a74f841aa0b515684cc17d7e1eb0a"
    else
      url "https://github.com/byteoxo/crypto-ticker/releases/download/v1.4.0/crypto-ticker_linux_amd64.tar.gz"
      sha256 "0eb926a3f77fc7ec4ea9469f7291ff5ced1ef2c251a61dd9e319beffe1aaa889"
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
