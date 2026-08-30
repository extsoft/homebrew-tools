# homebrew-tools

A Homebrew tap for [extsoft's](https://github.com/extsoft) CLI tools.

## Available formulae

- `brew install extsoft/tools/elegant-git` for <https://github.com/extsoft/elegant-git>

## Maintenance

After an Elegant Git GitHub release, bump the formula from this repo:

```shell
mise run bump-elegant-git -- vYYYY.M.D
brew audit --strict --formula extsoft/tools/elegant-git
brew reinstall extsoft/tools/elegant-git
# commit and push
```

The bump task rewrites only the release URLs and checksums. It does not commit.
