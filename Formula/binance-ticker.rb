class BinanceTicker < Formula
  desc "Terminal-based Binance futures/spot price ticker with real-time WebSocket updates"
  homepage "https://github.com/byteoxo/binance-ticker"
  license "MIT"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.1.0/binance-ticker_darwin_arm64.tar.gz"
      sha256 "86422cf7ad1e50d697329ae4e5647c11ce93bf787c02c6f396d6c910020a84cc"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.1.0/binance-ticker_darwin_amd64.tar.gz"
      sha256 "9da6d44500f9392fafe7e7300e538b8bc6d118b5699fb4864d7ff3da679c9ce9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.1.0/binance-ticker_linux_arm64.tar.gz"
      sha256 "cd2f8f8a9434fd205863c9b50990f64b073945ed5c57f00c9321c4dfce871cb8"
    else
      url "https://github.com/byteoxo/binance-ticker/releases/download/v1.1.0/binance-ticker_linux_amd64.tar.gz"
      sha256 "6e7687082b2270be915aff60e00c7b1f62dbb4a66dc5d4feb175bc671dc7f864"
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
