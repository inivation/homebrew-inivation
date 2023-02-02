class DvProcessing < Formula
  desc "Generic algorithms for event cameras."
  homepage "https://gitlab.com/inivation/dv/dv-processing/"
  url "https://release.inivation.com/processing/dv-processing-1.7.8.tar.gz"
  sha256 "6025348346e6e04666d930c3942e371628dde423609ec6fd246106a62442b571"

  version "1.7.8"

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
  depends_on "openssl"
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
