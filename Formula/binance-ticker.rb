class BinanceTicker < Formula
  desc "Terminal-based Binance futures/spot price ticker with real-time WebSocket updates"
  homepage "https://github.com/byteoxo/binance-ticker"
  license "MIT"
  version "1.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.3/binance-ticker_darwin_arm64.tar.gz"
      sha256 "3edcce86f292d22afff5b5fc3d77884e9bc543af9632d0a2e60b4c04bddd42dd"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.3/binance-ticker_darwin_amd64.tar.gz"
      sha256 "5edd1b06d28fc2bb883f3484fc39e2282bccab2c444db43bad7acc59ecd5c058"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.3/binance-ticker_linux_arm64.tar.gz"
      sha256 "59f427396f91f9860fbeb5d1cb22f4d23b85cbe2cfce8e929a4e743fa9f302a5"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.3/binance-ticker_linux_amd64.tar.gz"
      sha256 "9d68f7d980bf5b111f40cec48c854c736745109f7ebbb6fdf4c8e9dba6b87e23"
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
