# typed: false
# frozen_string_literal: true

# Template — placeholders 1.0.0 and @@SHA_*@@ are substituted by the
# release-cli workflow and the rendered formula is pushed to the tap repo.
class Tokenid < Formula
  desc     "Vaudit TokenID CLI — local LLM proxy with token usage analytics (token.audit.id)"
  homepage "https://token.audit.id"
  version  "1.0.0"
  license  "Apache-2.0"

  on_macos do
    on_arm do
      url    "https://github.com/blokid/tokenid-api-wrapper/releases/download/cli-v1.0.0/tokenid-darwin-arm64"
      sha256 "0096ad3e9d4da4b9f919401d8d821e01022f5239a2e724184a0859759c0e2d2a"
    end
    on_intel do
      url    "https://github.com/blokid/tokenid-api-wrapper/releases/download/cli-v1.0.0/tokenid-darwin-amd64"
      sha256 "63a5a8b50da4e0bc17b98c71862f46fdf62a63504418b303ad10acfdf98e14e3"
    end
  end

  on_linux do
    on_arm do
      url    "https://github.com/blokid/tokenid-api-wrapper/releases/download/cli-v1.0.0/tokenid-linux-arm64"
      sha256 "5f65ed51c0f2830b327befb56bfe442f558068bfd4bbd6cc79e38035be21d9bf"
    end
    on_intel do
      url    "https://github.com/blokid/tokenid-api-wrapper/releases/download/cli-v1.0.0/tokenid-linux-amd64"
      sha256 "493299690ec216099a816f5e3ca500258c148656ef678208f3d7eaa095be2e5f"
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
