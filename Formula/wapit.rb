class Wapit < Formula
  desc "Local WhatsApp Cloud API mock and inbox for development"
  homepage "https://github.com/patriciomartinns/wapit"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.2/wapit-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "2a39ac485e2f861ee2231333fe7b3fb2e381040b3bf509544ea5656cb4c27e64"
    end
    on_intel do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.2/wapit-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "ccf07402758477daf9db0bd8310add82f482e023d2137531f4ccd0a9fd44e93e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.2/wapit-v0.3.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "83eefe47475d5b4cce5e4075c986dc9dfcf5ecb3eee2888958b1f5445827083c"
    end
    on_intel do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.2/wapit-v0.3.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b01e73b7d39faf27a68ffd1611694c919e892f174c91cd015c433e0114477551"
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
