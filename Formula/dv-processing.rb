class DvProcessing < Formula
  desc "Generic algorithms for event cameras."
  homepage "https://gitlab.com/inivation/dv/dv-processing/"
  head "https://gitlab.com/inivation/dv/dv-processing-internal.git"
  url "https://gitlab.com/inivation/dv/dv-processing/-/archive/1.0.0/dv-processing-1.0.0.tar.gz"
  sha256 "e0ab45b9b66ddfc912df034e76ddbc2c69fd13a920ab2e9dec3b3d3051244cd5"

  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "boost"
  depends_on "opencv"
  depends_on "eigen"
  depends_on "fmt"
  depends_on "lz4"
  depends_on "zstd"

  def install
    args = ["-DENABLE_TESTS=1", "-DENABLE_BENCHMARKS=0", "-DENABLE_SAMPLES=0"]

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
