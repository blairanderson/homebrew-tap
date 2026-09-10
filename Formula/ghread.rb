# typed: false
# frozen_string_literal: true

# Homebrew formula for ghread.
# Install with: brew install blairanderson/tap/ghread
class Ghread < Formula
  desc "Print a file from a GitHub repo, straight to your terminal"
  homepage "https://github.com/blairanderson/ghread"
  url "https://github.com/blairanderson/ghread/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "9afe5cf5ea838ca754ad2da1dd082dc63f6aeef050ef9fdbfd76d66a77b8dcd7"
  license "MIT"

  depends_on "gh"

  def install
    bin.install "ghread"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/ghread 2>&1", 1)
  end
end
