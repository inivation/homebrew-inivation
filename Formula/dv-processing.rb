class DvProcessing < Formula
  desc "Generic algorithms for event cameras."
  homepage "https://gitlab.com/inivation/dv/dv-processing/"
  url "https://release.inivation.com/processing/dv-processing-1.7.9.tar.gz"
  sha256 "ce1a8d384671fe8ae57d3ba264eb3eec6f2ce91ac0bb47545afd2f9ebe8e7454"

  version "1.7.9"

  patch do
    url "https://gitlab.com/inivation/homebrew-inivation/-/raw/master/Formula/dv-processing-xcode-15.3-fix.patch"
    sha256 "120aa80d91be003ec7a6e35da98f58aa1f744eb63294d13023b5e98055919036"
  end

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

  def install
    args = ["-DENABLE_TESTS=1", "-DENABLE_UTILITIES=1", "-DENABLE_BENCHMARKS=0", "-DENABLE_SAMPLES=0", "-DENABLE_PYTHON=0"]

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
