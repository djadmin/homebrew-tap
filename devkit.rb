# typed: false
# frozen_string_literal: true

class Devkit < Formula
  desc "Local app registry, stable localhost URLs, and pm2 lifecycle for Claude Code workflows"
  homepage "https://github.com/djadmin/devkit"
  url "https://github.com/djadmin/devkit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "47f08923e83d2a03c49caef0554da2d24ae6c435867bfe3beb621c80d2958a99"
  version "0.1.0"
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
        pm2 startup && pm2 save   # install pm2 first: npm install -g pm2

      Then open: http://dash.localhost:8080

      ─────────────────────────────────────────────
      Wire into Claude Code — add to ~/.claude/CLAUDE.md:

        ## Local Web Apps — devkit
        When building any local web app, register it with devkit:
          devkit register --name <slug> --path <abs-path> --port <port> --cmd "<start-cmd>"
          devkit start <slug>
        Apps are then reachable at http://<slug>.localhost:8080
      ─────────────────────────────────────────────
    EOS
  end

  test do
    system "#{bin}/devkit", "version"
  end
end
