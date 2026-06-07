# typed: false
# frozen_string_literal: true

cask "devkit" do
  version "0.2.0"
  sha256 "435202092f854756a688e1e33fd22ac502fdc080e08d7b9847bf99abd0a375fc"

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
