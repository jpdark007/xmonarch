#!/bin/bash

# source $emsdk/emsdk_env.s
echo ================================================================================
echo Make sure your Emscripten environment is configured properly 
echo Please run \'source \$EMSDK_HOME/emsdk_env.sh\' before running this build script
echo Otherwise, you will get error \'emcc: command not found\'
echo ================================================================================

BUILD_DIR="_build"
FILES="wasm/cn.c blake/blake.c cryptonight/cryptonight.c groestl/groestl.c jh/jh_ansi_opt64.c keccak/keccak.c oaes/oaes_lib.c skein/skein.c "
FLAGS="-O3"
FLAGS=""

mkdir -p $BUILD_DIR

echo 
echo "1. Build .wasm (and .js)"
emcc -I. $FLAGS \
    -s WASM=1 \
    $FILES \
    -s EXPORTED_FUNCTIONS="['_main', '_cn_hash', '_cn_create_context', '_cn_destroy_context']" \
    -s ASSERTIONS=0 \
    -o $BUILD_DIR/cn.js

echo 
echo "2. Build .asmjs for non-wasm browser"
emcc -I. $FLAGS \
    $FILES \
    -s EXPORTED_FUNCTIONS="['_main', '_cn_hash', '_cn_create_context', '_cn_destroy_context']" \
    -s ASSERTIONS=0 \
    -o $BUILD_DIR/cn.asmjs.js
