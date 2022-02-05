class DvProcessing < Formula
  desc "Generic algorithms for event cameras."
  homepage "https://gitlab.com/inivation/dv/dv-processing/"
  head "https://gitlab.com/inivation/dv/dv-processing-internal.git"
  url "https://release.inivation.com/processing/dv-processing-1.2.0.tar.gz"
  sha256 "e6669a37d07e331f94d19f0f03162d046279c6ee173e89bfca648ba71affbbac"

  version "1.2.0"

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
