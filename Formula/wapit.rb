class Wapit < Formula
  desc "Local WhatsApp Cloud API mock and inbox for development"
  homepage "https://github.com/patriciomartinns/wapit"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.1/wapit-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "3340c1c3239c41454fba483bedabe819872ee61f39be4b97dcf525e40082e311"
    end
    on_intel do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.1/wapit-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "fcbdc80c68e652aa24135785889c9523c3d7197e6328e1df08faf37336843023"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.1/wapit-v0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4b7fcbaafcf5dcf581c1c5b75f3255a94104e6687851cb38a6649d715b0bcd29"
    end
    on_intel do
      url "https://github.com/patriciomartinns/wapit/releases/download/v0.3.1/wapit-v0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "62f6fe5193e1b0e35246d29a5093b9b034eb676a9b80284544cc90bfe553379b"
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
