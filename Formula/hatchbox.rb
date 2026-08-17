# typed: false
# frozen_string_literal: true

# Homebrew formula for the Hatchbox CLI.
# Install with: brew install blairanderson/tap/hatchbox
class Hatchbox < Formula
  desc "Command-line interface for the Hatchbox.io API"
  homepage "https://github.com/blairanderson/hatchbox-cli"
  url "https://github.com/blairanderson/hatchbox-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "146c10b88634d706e6e8af9fd18f420d9ff8bea101c21dffb7a1dea60beb7d7e"
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
