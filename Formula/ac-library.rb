class AcLibrary < Formula
  desc "AtCoder Library (ACL): header-only C++ library + expander script"
  homepage "https://github.com/atcoder/ac-library"
  url "https://github.com/atcoder/ac-library/archive/refs/tags/v1.6.tar.gz"
  sha256 "3316dc04ae0d71701dd578e0f9e3c492a509fe0a1ba50ec154844350b4170b9d"
  license "CC0-1.0"

  def install
    # Install headers
    include.install "atcoder"

    # Install expander.py
    bin.install "expander.py"
    chmod 0755, bin/"expander.py"
  end

  def caveats
    msg = +"\n"
    msg << "To compile C++ code with AC Library, run:\n\n"
    msg << "    g++ main.cpp -I\"#{HOMEBREW_PREFIX}/include\"\n\n"

    msg << "To avoid specifying `-I\"#{HOMEBREW_PREFIX}/include\"` every time, "
    msg << "you can add it to your environment:\n\n"
    msg << "    echo 'export CPLUS_INCLUDE_PATH=\"#{HOMEBREW_PREFIX}/include:${CPLUS_INCLUDE_PATH}\"' >> ~/.zshrc\n"
    msg << "    export CPLUS_INCLUDE_PATH=\"#{HOMEBREW_PREFIX}/include:${CPLUS_INCLUDE_PATH}\"\n\n"

    msg << "To use the expander script, run:\n\n"
    msg << "    expander.py main.cpp\n\n"

    unless which("python3")
      msg << "WARNING: `python3` was not found in your PATH.\n"
      msg << "         Please install Python 3 (e.g., `brew install python`) or ensure `python3` is on PATH.\n\n"
    end

    msg
  end

  test do
    (testpath/"main.cpp").write <<~CPP
      #include <atcoder/dsu>
      int main() { atcoder::dsu d(10); d.merge(0,1); }
    CPP
    system ENV.cxx, "main.cpp", "-std=c++17", "-I#{include}", "-o", "a.out"
    system "./a.out"

    # check the file is executable
    assert_predicate bin/"expander.py", :executable?
  end
end
