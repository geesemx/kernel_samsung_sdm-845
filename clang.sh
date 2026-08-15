# TOOLCHAIN PATH
TOOLCHAIN_PATH="$HOME/toolchain"
CLANG_PATH="$TOOLCHAIN_PATH/clang-r547379/bin/"
GCC_PATH="$TOOLCHAIN_PATH/aarch64-linux-android-4.9/bin"
OUTPUT_DIR="out"

# EXPORT PATH
export PATH="$CLANG_PATH:$GCC_PATH:$PATH"

# KERNEL CONFIG
make O=$OUTPUT_DIR ARCH=arm64 starqltechn_defconfig

# Opcional: Kernel Config
#make O=$OUTPUT_DIR ARCH=arm64 nconfig

# Build with clang
make -j$(nproc --all) O=$OUTPUT_DIR \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android- \
                      LLVM=1 \
                      LLVM_IAS=1 \
                      2>&1 | tee build_log.txt
