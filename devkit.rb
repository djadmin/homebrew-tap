# typed: false
# frozen_string_literal: true

class Devkit < Formula
  desc "Local app registry, stable localhost URLs, and lifecycle for Claude Code workflows"
  homepage "https://github.com/djadmin/devkit"
  url "https://github.com/djadmin/devkit/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "c92459e61a6ae756cabd4454bc36ea75750410f14d85d1809a4fd7d4cc933c42"
  version "0.4.0"
  license "MIT"
  depends_on :macos
  depends_on "jq"
  depends_on "caddy"

  def install
    bin.install "bin/devkit"
    pkgshare.install "apps.example.json"
  end

  def caveats
    <<~EOS
      To finish setup, run:
        devkit bootstrap
        brew services start caddy

      Then open your dashboard: http://dash.localhost

      ─────────────────────────────────────────────
      Wire into Claude Code so it registers apps automatically.
      Add to ~/.claude/CLAUDE.md:

        ## devkit — App Registration
        After creating any local web app or service:
          devkit register <slug> --port <port> --cmd "<start-cmd>"
          devkit start <slug>
        Apps are then reachable at http://<slug>.localhost
      ─────────────────────────────────────────────
    EOS
  end

  test do
    system "#{bin}/devkit", "version"
  end
end
