# REF: https://github.com/zellij-org/zellij/blob/main/CONTRIBUTING.md

FILE_DIR=$(dirname `realpath $0`)

ROOT_DIR=$PWD

# Zellij
cd $FILE_DIR/src

if [ -d "$FILE_DIR/src/target" ]; then 
    rm -rf "$FILE_DIR/src/target"
fi
cargo xtask build --release

cp $FILE_DIR/src/zellij-utils/assets/plugins/status-bar.wasm $FILE_DIR/plugins/custom-status-bar.wasm