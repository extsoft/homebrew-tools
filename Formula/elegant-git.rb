class ElegantGit < Formula
  desc "Assistant who carefully automates routine work with Git"
  homepage "https://elegant-git.extsoft.pro"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.9.1/eg-v2026.9.1-darwin-arm64.tar.gz"
      sha256 "ad450c97534357a7f13d2308b7f63c8938a466ca77f4e8f5060bfbdb19b2f993"
    end
    on_intel do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.9.1/eg-v2026.9.1-darwin-amd64.tar.gz"
      sha256 "1e0bb6c5aadf4ca1169118afc37a315ac83ce876b5d7eb887f9c5db98cb21632"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.9.1/eg-v2026.9.1-linux-arm64.tar.gz"
      sha256 "ae6a37ccbf67663b00bccf3c11d4a3e5526d710e84dc2641c2a8c2f678b65540"
    end
    on_intel do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.9.1/eg-v2026.9.1-linux-amd64.tar.gz"
      sha256 "2c28affb3ccfbfb8533173a4a6f3b550e9a6644323ed37bd68db1da6fa8dec48"
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
