# typed: false
# frozen_string_literal: true

# Homebrew formula for the Hatchbox CLI.
# Install with: brew install blairanderson/tap/hatchbox
class Hatchbox < Formula
  desc "Command-line interface for the Hatchbox.io API"
  homepage "https://github.com/blairanderson/hatchbox-cli"
  url "https://github.com/blairanderson/hatchbox-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f94f56fea98c1f202242fb17a4caaf09de4f9dd19f808ed489cbf1dfdff187a9"
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
