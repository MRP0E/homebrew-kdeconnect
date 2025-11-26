cask "kdeconnect" do
  name "KDE Connect"
  desc "Enabling communication between all your devices"
  homepage "https://kdeconnect.kde.org/"
  version "5560"

  livecheck do
    url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/"
    regex(/kdeconnect-kde-master-(\d+)-macos-clang-arm64\.dmg/)
    strategy :page_match
  end

  depends_on macos: ">= :monterey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-arm64/kdeconnect-kde-master-5560-macos-clang-arm64.dmg"
      sha256 "7ba540254a77e41a490a916906c1166cc826e3884f9ac74c5d8e860d91fbd930"
    else
      url "https://origin.cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/kdeconnect-kde-master-5560-macos-clang-x86_64.dmg"
      sha256 "3eb7f8eca0f95cac08dc6d69ea63c9f81354ca6f60fab2200af06fbc632172a8"
    end
  end

  app "KDE Connect.app"

  zap trash: [
    "~/Library/Application Support/kdeconnect.app",
    "~/Library/Application Support/kpeoplevcard/kdeconnect-*",
    "~/Library/Preferences/org.kde.kdeconnect.plist",
    "~/Library/Preferences/kdeconnect",
    "~/Library/Caches/kdeconnect",
    "~/Library/Logs/kdeconnect",
    "~/Library/Saved Application State/org.kde.kdeconnect.savedState"
  ]
end
