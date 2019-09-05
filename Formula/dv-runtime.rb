class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv-runtime/"
  head "https://gitlab.com/inivation/dv-runtime.git"
  url "https://gitlab.com/inivation/dv-runtime/-/archive/1.0.0/dv-runtime-1.0.0.tar.gz"
  sha256 "b18f5c01e88d04823f13fbbad1b0a6ff88f7ad36c2707ef76999804d2ed68d42"

  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libcaer"
  depends_on "boost"
  depends_on "openssl"
  depends_on "opencv"
  depends_on "google-perftools"
  depends_on "lz4"
  depends_on "zstd"

  def install
    args = []

    args << "-DENABLE_TCMALLOC=1"

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
