class BinanceTicker < Formula
  desc "Terminal-based Binance futures/spot price ticker with real-time WebSocket updates"
  homepage "https://github.com/byteoxo/binance-ticker"
  license "MIT"
  version "1.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.2/binance-ticker_darwin_arm64.tar.gz"
      sha256 "eb654e9cbbf946557a6508e2e936e3cfcb9388f271334a411b9759af8b3f8919"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.2/binance-ticker_darwin_amd64.tar.gz"
      sha256 "6d796d8822fa849b8610b529b5e5dbabc47554d50d124d524adecd974c061a83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.2/binance-ticker_linux_arm64.tar.gz"
      sha256 "d69924cd91dcd32b331333b584cdcff66cd649dc3d8e133ef439ca5f62d5a3f5"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.2/binance-ticker_linux_amd64.tar.gz"
      sha256 "fbaaf16b10ccecca54e2ba80b83452d83f37b9e5fc70de9b1d9988f2c66c5b3c"
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
