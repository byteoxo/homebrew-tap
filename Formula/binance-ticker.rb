class BinanceTicker < Formula
  desc "Terminal-based Binance futures/spot price ticker with real-time WebSocket updates"
  homepage "https://github.com/byteoxo/binance-ticker"
  license "MIT"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.0.0/binance-ticker_darwin_arm64.tar.gz"
      sha256 "3ca0a0158aad869127576a2b557ef168a5bf6b77cb7fb8bb0e47d67db30c9429"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.0.0/binance-ticker_darwin_amd64.tar.gz"
      sha256 "cbf8da85c6c33c5f584a8e194678dea30e51139108a984232efc653c7ff50cda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.0.0/binance-ticker_linux_arm64.tar.gz"
      sha256 "ec443033116a87caffbcd93aedff98df41772e0bb90afa5896c110bb47f0908c"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.0.0/binance-ticker_linux_amd64.tar.gz"
      sha256 "0c83c758b8d18950c6478238b34d7aea5b57032eac8d9613f0b68bf262929f02"
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
