class ElegantGit < Formula
  desc "Assistant who carefully automates routine work with Git"
  homepage "https://elegant-git.extsoft.pro"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.11.19/eg-v2026.11.19-darwin-arm64.tar.gz"
      sha256 "0008a274c485e02b04a6c5827dd3b187bc5df929e9c7425991a94ac09058c3ba"
    end
    on_intel do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.11.19/eg-v2026.11.19-darwin-amd64.tar.gz"
      sha256 "8303043452e3e964fe52f101d5e37b94cce6ca5ff96becc5337b9bf9c1505860"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.11.19/eg-v2026.11.19-linux-arm64.tar.gz"
      sha256 "7471fdb40b8e41988ad63b9be4d646be6227a2d615fa977d9160beb8a220f65e"
    end
    on_intel do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.11.19/eg-v2026.11.19-linux-amd64.tar.gz"
      sha256 "0037af757efe2e2330eda6841a0972fd1e5832e79ceeb94c680393875903165f"
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
