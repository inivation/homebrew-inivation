class DvProcessing < Formula
  desc "Generic algorithms for event cameras."
  homepage "https://gitlab.com/inivation/dv/dv-processing/"
  url "https://release.inivation.com/processing/dv-processing-2.0.2.tar.gz"
  sha256 "3d3c0eb3e4ee3f144929c0cc3c733443b9afecf2a37413a9a00e86cd7990e8cb"

  version "2.0.2"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "boost"
  depends_on "opencv"
  depends_on "eigen"
  depends_on "libusb"
  depends_on "fmt"
  depends_on "lz4"
  depends_on "zstd"
  depends_on "openssl"

  def install
    args = ["-DDVP_ENABLE_TESTS=ON", "-DDVP_ENABLE_SAMPLES=OFF", "-DDVP_ENABLE_UTILITIES=ON", "-DDVP_ENABLE_BENCHMARKS=OFF", "-DDVP_ENABLE_PYTHON=OFF"]

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
