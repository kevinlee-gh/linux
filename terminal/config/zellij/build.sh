FILE_DIR=$(dirname `realpath $0`)

ROOT_DIR=$PWD
cd $FILE_DIR/src/default-plugins/status-bar

if [ -d "$ROOT_DIR/tmp/zellij-status-bar" ]; then 
    rm -rf "$ROOT_DIR/tmp/zellij-status-bar"
fi
cargo build --release --target-dir $ROOT_DIR/tmp/zellij-status-bar

cp $ROOT_DIR/tmp/zellij-status-bar/wasm32-wasi/release/status-bar.wasm $ROOT_DIR/tmp/
# cd -