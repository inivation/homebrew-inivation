class DvProcessing < Formula
  desc "Generic algorithms for event cameras."
  homepage "https://gitlab.com/inivation/dv/dv-processing/"
  url "https://release.inivation.com/processing/dv-processing-1.5.0.tar.gz"
  sha256 "143c01db50702ba76b635a4d5d2ef243f34978f27e9de6d6c6722ebdd976ade0"

  version "1.5.0"

  option "with-python", "Build and install Python 3 module."

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "boost"
  depends_on "opencv"
  depends_on "eigen"
  depends_on "libcaer"
  depends_on "fmt"
  depends_on "lz4"
  depends_on "zstd"
  depends_on "python" => :optional
  depends_on "numpy" if build.with? "python"

  def install
    args = ["-DENABLE_TESTS=1", "-DENABLE_UTILITIES=1", "-DENABLE_BENCHMARKS=0", "-DENABLE_SAMPLES=0"]

    if build.with? "python"
      args << "-DENABLE_PYTHON=1"
    end

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
