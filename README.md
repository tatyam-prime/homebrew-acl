# homebrew-acl

[日本語](./README.ja.md) | English

This Homebrew Tap installs [AtCoder Library (ACL)](https://github.com/atcoder/ac-library) headers and the expander script.

## Install

```bash
brew tap tatyam-prime/homebrew-acl
brew install ac-library
# add `$(brew --prefix)/include` to default include path
echo 'export CPLUS_INCLUDE_PATH="$(brew --prefix)/include:${CPLUS_INCLUDE_PATH}"' >> ~/.zshrc
export CPLUS_INCLUDE_PATH="$(brew --prefix)/include:${CPLUS_INCLUDE_PATH}"
```

Verify:

```bash
echo '#include <atcoder/all>' | g++ -std=c++17 -fsyntax-only -xc++ -
expander.py -h
```

> [!NOTE]
> To use `expander.py`, you need `python3` available in your `PATH`.

## How to compile C++ code with AC Library

To compile C++ code that includes AC Library, specify Homebrew's include path:

```bash
g++ main.cpp -I"$(brew --prefix)/include"
```

To avoid specifying `-I"$(brew --prefix)/include"` every time, you can add it to your environment:

```bash
echo 'export CPLUS_INCLUDE_PATH="$(brew --prefix)/include:${CPLUS_INCLUDE_PATH}"' >> ~/.zshrc
export CPLUS_INCLUDE_PATH="$(brew --prefix)/include:${CPLUS_INCLUDE_PATH}"
``` 

## How to use `expander.py`

To expand `#include`s of AC Library in `main.cpp`, run:

```bash
expander.py main.cpp
```

The expanded code will be generated as `combined.cpp`.

To copy the expanded code to clipboard (macOS), run:

```bash
expander.py -c main.cpp | pbcopy
```

To show help message, run:

```bash
expander.py -h
```

## Read what this Tap will do

[Formula/ac-library.rb](Formula/ac-library.rb)
