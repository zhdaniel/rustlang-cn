#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build


if [[ "$TRAVIS_OS_NAME" == "linux" && "$TRAVIS_PULL_REQUEST" = "false" && "$TRAVIS_BRANCH" == "master" ]]; then
  # cp CNAME docs/.vuepress/dist
  git clone https://github.com/davisp/ghp-import.git &&
  ./ghp-import/ghp_import.py -n -p -f -m "Documentation upload" -b master -r https://"$RUST_TOKEN"@github.com/rustlang-cn/rustlang-cn.github.io.git docs/.vuepress/dist &&
  echo "Uploaded documentation"
fi
