class Devdesktopproject < Formula
  desc "Mon projet Electron + Vite + React"
  homepage "https://github.com/bisounours1111/dev-desktop-project"
  url "https://github.com/bisounours1111/dev-desktop-project/releases/download/v1/Human-Agement.dmg"
  version "1.0.0"
  sha256 "64a92a50d61f528030743a3a7f6e4b4c8f331d277bcd61089e69a29fdce2a215"

  def install
    system "hdiutil", "attach", cached_download
    system "cp", "-r", "/Volumes/Human-Agement/DevDesktopProject.app", prefix
    system "hdiutil", "detach", "/Volumes/Human-Agement"
  end

  def caveats
    <<~EOS
      DevDesktopProject est installé dans #{prefix}/DevDesktopProject.app.
      Tu peux lancer l'application avec :
        open #{prefix}/DevDesktopProject.app
    EOS
  end
end
