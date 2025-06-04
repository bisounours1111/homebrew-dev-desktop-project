class Devdesktopproject < Formula
  desc "Mon projet Electron + Vite + React"
  homepage "https://github.com/bisounours1111/dev-desktop-project"
  url "https://github.com/bisounours1111/dev-desktop-project/releases/download/v1/Human.Agement-1.0.0-arm64.dmg"
  sha256 "5032da418849b99de7ffa197c1065536551a7bdb95982c974b882ff9c13c88da"

  def install
    system "hdiutil", "attach", cached_download
    # Échappement correct pour le chemin avec apostrophe
    system "cp", "-r", "/Volumes/Human'Agement/DevDesktopProject.app", prefix
    system "hdiutil", "detach", "/Volumes/Human'Agement"
  end
  
  
  

  def caveats
    <<~EOS
      DevDesktopProject est installé dans #{prefix}/DevDesktopProject.app.
      Tu peux lancer l'application avec :
        open #{prefix}/DevDesktopProject.app
    EOS
  end
end
