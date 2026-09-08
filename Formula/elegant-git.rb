class ElegantGit < Formula
  desc "Assistant who carefully automates routine work with Git"
  homepage "https://elegant-git.extsoft.pro"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.9.8/eg-v2026.9.8-darwin-arm64.tar.gz"
      sha256 "97759983d42c0135c0f6642000d297b162a39adab33eb0684c2cf453b41aaaf2"
    end
    on_intel do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.9.8/eg-v2026.9.8-darwin-amd64.tar.gz"
      sha256 "3f8f885e46789c6ec88fb85a2b327724fa7b09a64e5c58645f4ba7e69c9df0d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.9.8/eg-v2026.9.8-linux-arm64.tar.gz"
      sha256 "e4377dc1b891ba6e0f2252efb94335885194f1e3dfc7aa7aeb60404bbfca9e34"
    end
    on_intel do
      url "https://github.com/extsoft/elegant-git/releases/download/v2026.9.8/eg-v2026.9.8-linux-amd64.tar.gz"
      sha256 "608ba09ed899232b837c78c954aa1c61144198a5b0aae3b82f365f903c3cb0fa"
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
