class Wapit < Formula
  desc "Local WhatsApp Cloud API mock and inbox for development"
  homepage "https://github.com/patriciomartinns/wapit"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.0/wapit-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "994cff4841b9b29ebc5828372dcf4cb9564943d2b9b09d2b0f7f1db673cbd60e"
    end
    on_intel do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.0/wapit-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "eb64e4e37556c72fac11ccfb235d65ab21929cd71c1486b13a7880c0f354e539"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.0/wapit-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "be4433b475b02906a690414fc1836adaa19acb06e22531a67cb8491fe98b9d36"
    end
    on_intel do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.0/wapit-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e70944d25519b0dde29e49f09cbd447d096fa3b06b504b429e881d7c4d6af8f7"
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
