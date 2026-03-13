class BinanceTicker < Formula
  desc "Terminal-based Binance futures/spot price ticker with real-time WebSocket updates"
  homepage "https://github.com/byteoxo/binance-ticker"
  license "MIT"
  version "1.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.4/binance-ticker_darwin_arm64.tar.gz"
      sha256 "1c8e2b60f1458f5be163e3505341d549277cb6c2c94490dbc9a7b4750e6cfd66"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.4/binance-ticker_darwin_amd64.tar.gz"
      sha256 "577906e7895ae57efe28721c88ebfb901a0a12f97e3957b1cd6ef739c008a0a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.4/binance-ticker_linux_arm64.tar.gz"
      sha256 "8a15570c515b0e50fac6c6e985ff9c0667a59e7808dd4059f1cc7a0ceb9cb10d"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.2.4/binance-ticker_linux_amd64.tar.gz"
      sha256 "cd7a76811478ff7da21797ab4921f7d4d544c77e597a656dfd7692b1510181a9"
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
