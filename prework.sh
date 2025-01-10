#!/bin/bash

# 检查是否存在 crates 路径，如果不存在则创建
if [ ! -d "./crates" ]; then
    echo "crates 正在创建..."
    mkdir crates
else
    echo "crates 路径已存在。"
fi

kbuild patch add taskctx;
cd crates/taskctx;
git reset --hard 3c3ad2fb4defce02bc6186b836471ad28ab9c349;
cd ../..
# 使用 sed 替换 channel 的值
sed -i 's/channel = "nightly-2024-05-02"/channel = "nightly"/' rust-toolchain.toml

cargo update;

sed -i 's/channel = "nightly"/channel = "nightly-2024-05-02"/' rust-toolchain.toml

