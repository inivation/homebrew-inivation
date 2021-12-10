class DvProcessing < Formula
  desc "Generic algorithms for event cameras."
  homepage "https://gitlab.com/inivation/dv/dv-processing/"
  head "https://gitlab.com/inivation/dv/dv-processing-internal.git"
  url "https://release.inivation.com/processing/dv-processing-1.0.0.zip"
  sha256 "0f9465e0736dcb5d7a84d03b55e91209f282de60ec91c6f235b43b04eb765f92"

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
