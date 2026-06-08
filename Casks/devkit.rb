cask "devkit" do
  version "0.3.0"
  sha256 "68c46304d34e4d84a2fdbf292033ea6183873632d93fe1053ad9b4c9ad7b2c60"
  url "https://github.com/djadmin/devkit/releases/download/v0.3.0/DevkitBar.zip"
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
