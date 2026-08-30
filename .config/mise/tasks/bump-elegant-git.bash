#!/usr/bin/env bash
#MISE description="bump elegant-git to a GitHub release"
set -o pipefail -o errexit -o nounset

root="$(git rev-parse --show-toplevel)"
cd "${root}"

tag="${1:-}"
if [[ -z ${tag} ]]; then
  echo "Error: version is required (e.g. v2026.8.29)" >&2
  exit 1
fi
if [[ ${tag} != v* ]]; then
  tag="v${tag}"
fi

formula="Formula/elegant-git.rb"
if [[ ! -f ${formula} ]]; then
  echo "Error: ${formula} not found" >&2
  exit 1
fi

old_tag=""
if [[ $(grep -m1 'url "' "${formula}") =~ download/(v[^/]+)/ ]]; then
  old_tag="${BASH_REMATCH[1]}"
fi
if [[ -z ${old_tag} ]]; then
  echo "Error: could not read current tag from ${formula}" >&2
  exit 1
fi
if [[ ${old_tag} == "${tag}" ]]; then
  echo "Error: formula already at ${tag}" >&2
  exit 1
fi

platforms=(
  darwin-arm64
  darwin-amd64
  linux-arm64
  linux-amd64
)

tmpdir="$(mktemp -d)"
tmp="$(mktemp)"
trap 'rm -rf "${tmpdir}" "${tmp}"' EXIT

for platform in "${platforms[@]}"; do
  asset="eg-${tag}-${platform}.tar.gz.sha256"
  gh release download "${tag}" --repo extsoft/elegant-git --dir "${tmpdir}" --pattern "${asset}"
  if [[ ! -f ${tmpdir}/${asset} ]]; then
    echo "Error: missing checksum asset: ${asset}" >&2
    exit 1
  fi
done

read_sha() {
  local platform=$1
  tr -d '[:space:]' <"${tmpdir}/eg-${tag}-${platform}.tar.gz.sha256"
}

pending_platform=""
while IFS= read -r line || [[ -n ${line} ]]; do
  if [[ ${line} == *'url "'* ]]; then
    line="${line//${old_tag}/${tag}}"
    pending_platform=""
    for platform in "${platforms[@]}"; do
      if [[ ${line} == *"-${platform}.tar.gz"* ]]; then
        pending_platform="${platform}"
        break
      fi
    done
    printf '%s\n' "${line}"
    continue
  fi
  if [[ -n ${pending_platform} && ${line} == *sha256* ]]; then
    indent="${line%%sha256*}"
    printf '%s\n' "${indent}sha256 \"$(read_sha "${pending_platform}")\""
    pending_platform=""
    continue
  fi
  printf '%s\n' "${line}"
done <"${formula}" >"${tmp}"
mv "${tmp}" "${formula}"

echo "Bumped ${formula} ${old_tag} -> ${tag}"
git --no-pager diff -- "${formula}"
