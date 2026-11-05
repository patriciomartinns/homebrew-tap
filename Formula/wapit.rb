class Wapit < Formula
  desc "Local WhatsApp Cloud API mock and inbox for development"
  homepage "https://github.com/patriciomartinns/wapit"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.2.0/wapit-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "3513698d2cf6e70a4ea208a80a4d8832ddf859f4884d54317bf8e06a283c4d40"
    end
    on_intel do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.2.0/wapit-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "b7dad280ed68ff5d4844a8feebed970fb83f410fb76264ea0f0732f84610d7f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.2.0/wapit-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f03a1024123a7752fcb12978701f1f0380fc87502f14ad018c9ff1caaafe9f6f"
    end
    on_intel do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.2.0/wapit-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2085d603a7129379c83d6ae5761de703c371fc31823fe04100ea231fec8a8421"
    end
  end

  def install
    bin.install "wapit"
  end

  service do
    run [opt_bin/"wapit"]
    environment_variables WAPIT_CONFIG_DIR: etc/"wapit", WAPIT_DATA_DIR: var/"wapit"
    keep_alive true
    log_path var/"log/wapit.log"
    error_log_path var/"log/wapit.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wapit --version")
  end
end
