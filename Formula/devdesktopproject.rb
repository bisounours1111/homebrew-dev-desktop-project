class Devdesktopproject < Formula
  desc "Mon projet Electron + Vite + React"
  homepage "https://github.com/bisounours1111/dev-desktop-project"
  url "https://github.com/bisounours1111/dev-desktop-project/releases/download/v1/Human-Agement.dmg"
  version "1.0.0"
  sha256 "64a92a50d61f528030743a3a7f6e4b4c8f331d277bcd61089e69a29fdce2a215"

  def install
    # Démontage forcé si le DMG est déjà monté
    system "hdiutil", "detach", "/Volumes/Human-Agement", "-force" rescue nil
    
    # Montage du DMG
    volume = `hdiutil attach -nobrowse #{cached_download} | grep "/Volumes/" | cut -f 3-`.strip
    ohai "Volume monté : #{volume}"
    
    # Vérification du contenu
    system "ls", "-la", volume
    ohai "Tentative de copie..."
    
    # Copie de l'application
    system "cp", "-r", "#{volume}/Human-Agement.app", prefix
    
    # Démontage propre
    system "hdiutil", "detach", volume
  end

  def caveats
    <<~EOS
      Human-Agement est installé dans #{prefix}/Human-Agement.app.
      Tu peux lancer l'application avec :
        open #{prefix}/Human-Agement.app
    EOS
  end
end
