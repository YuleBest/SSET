# SSET - Shell 脚本加密工厔

Shell Script Encryption Tool

严禁使用本项目加密违法中华人民共和国网络安全法和其他法律法规的内容，使用本脚本进行加密的文件若造成不必要的麻烦，责任由加密者自行负责，项目作者不负任何责任。继续则表示您同意以上条约。

---

## 快速开始

### 前置条件

- Termux

- 设备已开启存储权限

---

### 环境配置

1. 创建项目目录并进入

```bash
mkdir -p $HOME/SSET && cd $HOME/SSET
```

2. 下载最新版加密工具 `SSET.sh`

3. 配置执行权限

```bash
chmod 755 SSET.sh
```

4. 安装依赖工具链

```bash
pkg update -y && pkg install -y clang shc gzip base64
```

---

### 首次使用流程

1. 初始化加密环境

```bash
bash SSET.sh
```

工具自动生成 `source_sh/` 目录用于存放待加密脚本

2. 放入待加密脚本，支持批量处理

3. 再次运行脚本，自动触发加密流程：

```bash
bash SSET.sh
```

---

### 后续使用

仅需重复步骤2-3，每次更新待加密脚本后执行一次即可

---

## 加密原理

### 五层防护流程

```
    A       -->      SHC 编译得到 ELF 文件
    B       -->      GZIP 压缩得到压缩文件
    C       -->      BASE64 编码
    D       -->      生成自解密脚本
```
