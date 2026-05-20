# typed: false
# frozen_string_literal: true

# Template — placeholders 0.1.2-beta and @@SHA_*@@ are substituted by the
# release-cli workflow and the rendered formula is pushed to the tap repo.
class Tokenid < Formula
  desc     "Vaudit TokenID CLI — local LLM proxy with token usage analytics (token.audit.id)"
  homepage "https://token.audit.id"
  version  "0.1.2-beta"
  license  "Apache-2.0"

  on_macos do
    on_arm do
      url    "https://github.com/blokid/tokenid-api-wrapper/releases/download/cli-v0.1.2-beta/tokenid-darwin-arm64"
      sha256 "56c686f04074c33fa92c8712ed78610da382c7ec7b23dcca335f630daa5f8ef9"
    end
    on_intel do
      url    "https://github.com/blokid/tokenid-api-wrapper/releases/download/cli-v0.1.2-beta/tokenid-darwin-amd64"
      sha256 "04950914cae01f93043bfc312d3b873203cfd12cca182229daebb808ca4634ba"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/blokid/tokenid-api-wrapper/releases/download/cli-v0.1.2-beta/tokenid-linux-arm64"
      sha256 "e84fa50a22d6ef34467771b0e1d2a7f695d6d95d29eb83dfe3a64377b753e386"
    end
    on_intel do
      url    "https://github.com/blokid/tokenid-api-wrapper/releases/download/cli-v0.1.2-beta/tokenid-linux-amd64"
      sha256 "854d3fc891feed0877a59be25734d96b39f5bd848027958e9b6b4d88ef912a38"
    end
  end

  def install
    binary = Dir["tokenid-*"].first or raise "no tokenid binary found"
    bin.install binary => "tokenid"
  end

  test do
    assert_match(/^tokenid /, shell_output("#{bin}/tokenid version"))
  end
end
