class DvProcessing < Formula
  desc "Generic algorithms for event cameras."
  homepage "https://gitlab.com/inivation/dv/dv-processing/"
  url "https://release.inivation.com/processing/dv-processing-1.5.1.tar.gz"
  sha256 "13cffd17e761825c4a30997fa009fe381c088353028f683e24ae501439003295"

  version "1.5.1"

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
