# typed: false
# frozen_string_literal: true

# Homebrew formula for the Hatchbox CLI.
# Install with: brew install blairanderson/tap/hatchbox
class Hatchbox < Formula
  desc "Command-line interface for the Hatchbox.io API"
  homepage "https://github.com/blairanderson/hatchbox-cli"
  url "https://github.com/blairanderson/hatchbox-cli/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "d5a410ae39885cca48c7d283e3be1afd4aeb06fcab2e5eb2310408587ab1c4af"
  license "MIT"

  depends_on "ruby"

  def install
    libexec.install "lib", "bin"
    (bin/"hatchbox").write <<~SH
      #!/bin/bash
      exec "#{Formula["ruby"].opt_bin}/ruby" "#{libexec}/bin/hatchbox" "$@"
    SH
    chmod 0755, bin/"hatchbox"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hatchbox --version")
  end
end
