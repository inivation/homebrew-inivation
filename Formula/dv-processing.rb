class DvProcessing < Formula
  desc "Generic algorithms for event cameras."
  homepage "https://gitlab.com/inivation/dv/dv-processing/"
  head "https://gitlab.com/inivation/dv/dv-processing-internal.git"
  url "https://release.inivation.com/processing/dv-processing-1.3.0.tar.gz"
  sha256 "623ad426c1f8983672e99f0bbe02da2ba1c209766366b56209fe44d4f123656e"

  version "1.3.0"

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
