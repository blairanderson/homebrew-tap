# typed: false
# frozen_string_literal: true

# Homebrew formula for ghread.
# Install with: brew install blairanderson/tap/ghread
class Ghread < Formula
  desc "Print a file from a GitHub repo, straight to your terminal"
  homepage "https://github.com/blairanderson/ghread"
  url "https://github.com/blairanderson/ghread/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1ab7f09d5f5e86670eddcaa3e72e1228c1b6c90c2d9b3dce998f4b22b3cf5c25"
  license "MIT"

  depends_on "gh"

  def install
    bin.install "ghread"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/ghread 2>&1", 1)
  end
end
