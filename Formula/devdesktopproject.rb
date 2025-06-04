class Devdesktopproject < Formula
  desc "Mon projet Electron + Vite + React"
  homepage "https://github.com/bisounours1111/dev-desktop-project"
  url "https://github.com/bisounours1111/dev-desktop-project/releases/download/v1/Human.Agement-1.0.0-arm64.dmg"
  sha256 "5032da418849b99de7ffa197c1065536551a7bdb95982c974b882ff9c13c88da"

  def install
    system "hdiutil", "attach", cached_download
  
    # Liste les volumes montés pour debug
    system "ls", "/Volumes"
  
    # Ensuite copie le bon chemin (à adapter selon le nom exact du volume)
    system "cp", "-r", "/Volumes/<NomDuVolume>/DevDesktopProject.app", prefix
  
    system "hdiutil", "detach", "/Volumes/<NomDuVolume>"
  end
  

  def caveats
    <<~EOS
      DevDesktopProject est installé dans #{prefix}/DevDesktopProject.app.
      Tu peux lancer l'application avec :
        open #{prefix}/DevDesktopProject.app
    EOS
  end
end
