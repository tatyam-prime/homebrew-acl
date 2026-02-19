# homebrew-acl

日本語 | [English](./README.md)

この Homebrew Tap は [AtCoder Library (ACL)](https://github.com/atcoder/ac-library) のヘッダファイルと expander スクリプトをインストールします。

## インストール

```bash
brew tap tatyam-prime/acl
brew install ac-library
# デフォルトの include path に `$(brew --prefix)/include` を追加
echo 'export CPLUS_INCLUDE_PATH="'$(brew --prefix)'/include:${CPLUS_INCLUDE_PATH}"' >> ~/.zshrc
export CPLUS_INCLUDE_PATH="$(brew --prefix)/include:${CPLUS_INCLUDE_PATH}"
```

動くことを検証するには:

```bash
echo '#include <atcoder/all>' | g++ -std=c++17 -fsyntax-only -xc++ -
expander.py -h
```

> [!NOTE]
> `expander.py` を使用するには、`python3` が `$PATH` に含まれている必要があります。

## AC Library を使ったコードをコンパイルするには

AC Library を使ったコードをコンパイルするには、Homebrew の include path を以下のように指定します:

```bash
g++ main.cpp -I"$(brew --prefix)/include"
```

以下のように環境変数に追加しておけば、毎回 `-I"$(brew --prefix)/include"` を指定する必要がなくなります:

```bash
echo 'export CPLUS_INCLUDE_PATH="'$(brew --prefix)'/include:${CPLUS_INCLUDE_PATH}"' >> ~/.zshrc
export CPLUS_INCLUDE_PATH="$(brew --prefix)/include:${CPLUS_INCLUDE_PATH}"
``` 

## `expander.py` の使い方

`main.cpp` に含まれる AC Library の `#include` を展開するには:

```bash
expander.py main.cpp
```

展開されたコードは `combined.cpp` として生成されます。

(macOS で) 展開されたコードをクリップボードにコピーするには:

```bash
expander.py -c main.cpp | pbcopy
```

ヘルプメッセージを表示するには:

```bash
expander.py -h
```

## この Tap が何を実行するか確認する

[Formula/ac-library.rb](./Formula/ac-library.rb)
