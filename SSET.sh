#!/data/user/0/com.termux/files/usr/bin/bash
# Shell Script Encryption Tool (SSET) v1.0
# By Yule
# 严禁用于带有攻击性和违法的脚本的加密，否则一切后果由您自行承担！
# Encryption for scripts that are offensive or illegal is strictly prohibited, otherwise all consequences are at your own expense!

clear; SDIR="$(dirname $(readlink -f $0))"; gr='\033[0;32m'; ye='\033[1;33m'; re='\033[0;31m'; res='\033[0m'

S_SH_DIR="$SDIR/source_sh"
TEMP_DIR="$SDIR/temp_file"
T_SH_DIR="$SDIR/OUTPUT"

TO_DECLASSIFY='R="$RANDOM"; T="$RANDOM"; S="$(readlink -f $0)"; C="/data"; D="$C/data"; E="$D/$R"; F="$E/$T"; Y="UMAK"; K="se6"; U="TAJKQPMK_QU"; J="ba"; L="4 -d $F"; NQK="${J}${K}${L}"; PP="gu"; QQ="nzi"; WW="p "$F""; EE=".gz"; RR="${PP}${QQ}${WW}${EE}"; V="$F"; VV="$V"
0() {
    exit 0
}
A() {
    mkdir -p "$E"
    sed "1,/^# encryption tool by yule/d" "$S" > "$F"
    eval "$NQK" > "$F.gz"
}
B() {
    rm "$F"
    eval "$RR"
}
D() {
    sleep 2
    rm -rf "$E"
}
VV() {
    chmod 755 "$F"
    eval "$V" &
    D
}
A; B; VV
0
# encryption tool by yule'


# 检查环境和依赖工具完整性

check_bash() {
    if [ -z $BASH ] || [ "$BASH" = '' ] ; then
        echo -e "${re}- 请使用 BASH 环境运行本工具 (bash SSET.sh)${res}"
        exit 1
    fi
}

check_tools() {
    local dont_cont=0
    local tools="base64 gzip shc clang"
    local lose_tools
    for tool in $tools; do
        echo -en "- Check $tool...  "
        if ! command -v "$tool" &> /dev/null; then
            echo -e "${re}ERROR${res}"
            lose_tools="$lose_tools $tool"
            dont_cont=1
        else
            echo -e "${gr}OK${res}"
        fi
    done
    [[ $dont_cont == 1 ]] && echo -e "${re}\n- 未安装的工具:${lose_tools}。请先安装${res}" && exit 1
}

# 进行加密操作

MAIN() {
    local file
    rm -rf "$TEMP_DIR"
    mkdir "$S_SH_DIR" > /dev/null 2>&1
    mkdir "$TEMP_DIR" > /dev/null 2>&1

    if [ ! -d "$S_SH_DIR" ] || [ -z "$(find "$S_SH_DIR" -maxdepth 1 -name '*.sh')" ]; then
        echo -e "${ye}- 源目录不存在或没有.sh文件${res}"
        exit 2
    fi

    find "$S_SH_DIR" -type f -name '*.sh' -print0 | while IFS= read -r -d '' file; do
        if [[ "$(head -n 1 "$file")" != '#!/data/user/0/bin.mt.plus/files/term/bin/bash' ]]; then
            echo -n "- 添加 Shebang 行中...  "
            if echo '#!/data/user/0/bin.mt.plus/files/term/bin/bash' | cat - "$file" > "$file.temp" && mv "$file.temp" "$file" > /dev/null 2>&1; then
                echo -e "${gr}OK${res}"
            else
                echo -e "${re}ERROR${res}"
                exit 10
            fi
        fi
        local real_filename="加密_$(basename "$file")"

        echo -n "- shc: 处理 $(basename "$file") 中...  "
        if shc -f "$file" -o "$TEMP_DIR/$(basename "$file").elf" > /dev/null 2>&1; then
            echo -e "${gr}OK${res}"
            mv "$S_SH_DIR/$(basename "$file").x.c" "$TEMP_DIR/$(basename "$file").c"
        else
            echo -e "${re}ERROR${res}"
            mv "$S_SH_DIR/$(basename "$file").x.c" "$TEMP_DIR/$(basename "$file").c"
            exit 11
        fi

        file="$TEMP_DIR/$(basename "$file").elf"
        echo -n "- gzip: 压缩 $(basename "$file") 中...  "
        if gzip -9 "$file" > /dev/null; then
            echo -e "${gr}OK${res}"
        else
            echo -e "${re}ERROR${res}"
            exit 12
        fi

        file="$TEMP_DIR/$(basename "$file").gz"
        echo -n "- base64: 获取 $(basename "$file") 的 Base64 中...  "
        if base64 -w0 "$file" > "$TEMP_DIR/$(basename "$file").base64"; then
            echo -e "${gr}OK${res}"
        else
            echo -e "${re}ERROR${res}"
            exit 13
        fi

        mkdir "$T_SH_DIR" > /dev/null 2>&1
        echo -n "- touch: 创建 $(basename "$file")...  "
        if touch "$T_SH_DIR/$real_filename"; then
            echo -e "${gr}OK${res}"
        else
            echo -e "${re}ERROR${res}"
            exit 13
        fi

        file="$TEMP_DIR/$(basename "$file").base64"
        echo -n "- SSET: 为 $real_filename 植入解密逻辑  "
        echo "$TO_DECLASSIFY" > "$T_SH_DIR/$real_filename"
        if cat "$file" >> "$T_SH_DIR/$real_filename"; then
            echo -e "${gr}OK${res}"
        else
            echo -e "${re}ERROR${res}"
            exit 14
        fi
        echo -e "${gr}$real_filename 处理完成${res}\n"
    done
}

check_bash
check_tools
MAIN