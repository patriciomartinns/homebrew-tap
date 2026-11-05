class Wapit < Formula
  desc "Local WhatsApp Cloud API mock and inbox for development"
  homepage "https://github.com/patriciomartinns/wapit"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.1.0/wapit-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "34af428efbe8cff0c715016962c138b7e5b9c357eadfa493fbb9182ab0fa4b6e"
    end
    on_intel do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.1.0/wapit-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "8b831f9d6a15fa5380a1e4022345aaea9fc90bc75e26e8a322139ae64848cc64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.1.0/wapit-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4b60fbdf7f891847b9076495f46b9d651340fac821038ab55a85a4b342941a6f"
    end
    on_intel do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.1.0/wapit-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "62148193800db76ef5e9a0c28fb8f281489c24ad2060c0ad03eaa162cda03e8f"
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
