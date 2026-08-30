class ElegantGit < Formula
  desc "Assistant who carefully automates routine work with Git"
  homepage "https://elegant-git.extsoft.pro"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.8.29/eg-v2026.8.29-darwin-arm64.tar.gz"
      sha256 "42c3835f1f08249b662c586a225789ed1803d4193b890661c0a92e38b94ad754"
    end
    on_intel do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.8.29/eg-v2026.8.29-darwin-amd64.tar.gz"
      sha256 "2ae836b43b92778cdacdaaf5bea21baca7c4fc7a922821dc69cacf3f34631546"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.8.29/eg-v2026.8.29-linux-arm64.tar.gz"
      sha256 "b01abbfb0e0230c28305cfe68cc7cfd051cf350aa78e53dc73b26da04b0c7413"
    end
    on_intel do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.8.29/eg-v2026.8.29-linux-amd64.tar.gz"
      sha256 "122702e93b15017303a8461938eaae53f71bf07fd4bf53fedc3bc3eb2f7f74f4"
    end
  end

  def install
    bin.install "eg"
    generate_completions_from_executable(bin/"eg", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    system bin/"eg", "version"
  end
end
