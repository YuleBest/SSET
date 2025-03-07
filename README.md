# SSET

Shell Script Encryption Tool

Shell 脚本加密工具

> 加密混淆你的 Shell 脚本

---

# 使用方法

1. 下载安装 Termux

2. 新建文件夹 `/data/user/0/com.termux/files/home/SSET`，下载上方最新的 `SSET.sh`，放到刚刚的文件夹里面

3. Termux 执行以下代码以配置环境：

```shell
cd SEET; chmod -R 755 .
pkg update; pkg upgrade
```

4. Termux 执行以下代码以安装必要工具：

> 若安装过程提示是否继续，请选择 `y`

```shell
pkg install clang shc gzip base64
```

5. 用下面的代码执行一遍 `SSET.sh`，脚本会在脚本所在目录下生成一个 `source_sh/` 目录，把你需要加密的脚本放在这里面，然后再执行一遍即可开始加密：

```shell
bash SSET.sh
```

6. 之后只需要进行第 5 步即可