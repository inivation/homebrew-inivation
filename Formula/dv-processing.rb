class DvProcessing < Formula
  desc "Generic algorithms for event cameras."
  homepage "https://gitlab.com/inivation/dv/dv-processing/"
  url "https://release.inivation.com/processing/dv-processing-1.4.0.tar.gz"
  sha256 "07d3e0bd1bdec2a908af79f0515178036fa3a0652e2ebc59f59e101f14dcdeb3"

  version "1.4.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "boost"
  depends_on "opencv"
  depends_on "eigen"
  depends_on "libcaer"
  depends_on "fmt"
  depends_on "lz4"
  depends_on "zstd"
  depends_on "python"
  depends_on "numpy"

  def install
    args = ["-DENABLE_TESTS=1", "-DENABLE_BENCHMARKS=0", "-DENABLE_SAMPLES=0", "-DENABLE_PYTHON=1"]

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
