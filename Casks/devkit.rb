# typed: false
# frozen_string_literal: true

cask "devkit" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/djadmin/devkit/releases/download/v#{version}/DevkitBar.zip"
  name "DevkitBar"
  desc "Menu bar app to manage all your local web apps"
  homepage "https://github.com/djadmin/devkit"

  depends_on formula: "djadmin/tap/devkit"

  app "DevkitBar.app"

  zap trash: [
    "~/Library/Application Support/DevkitBar",
    "~/Library/Preferences/com.devkit.menubar.plist",
    "~/Library/Caches/com.devkit.menubar",
  ]
end
