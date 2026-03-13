class BinanceTicker < Formula
  desc "Terminal-based Binance futures/spot price ticker with real-time WebSocket updates"
  homepage "https://github.com/byteoxo/binance-ticker"
  license "MIT"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.0/binance-ticker_darwin_arm64.tar.gz"
      sha256 "94a173551d37b0b4cf18ebe525c861d63291e6d79518c30127c8b41248d03068"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.0/binance-ticker_darwin_amd64.tar.gz"
      sha256 "5970b19806880bde3dc097e978cd3bef2babf5b45fa9aed111dc965eaea86523"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.0/binance-ticker_linux_arm64.tar.gz"
      sha256 "2000b765fa480a414f64a91041bd0dfccd5d75927872a0abc8bcadc30eb6ae8d"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.0/binance-ticker_linux_amd64.tar.gz"
      sha256 "133a6241cd0cee578752d7f4cb84986c4acde33dff3e4e4d6eac84e5409616e2"
    end
  end

  def install
    bin.install "binance-ticker"
    bin.install_symlink "binance-ticker" => "bt"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/bt --help 2>&1", 1)
  end
end
