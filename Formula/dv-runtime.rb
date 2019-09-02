class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv-runtime/"
  head "https://gitlab.com/inivation/dv-runtime.git"
  url "https://gitlab.com/inivation/dv-runtime/-/archive/0.9.6/dv-runtime-0.9.6.tar.gz"
  sha256 "812f378c79fb3ec5703c736afc68fd0f4a8d8396738ed7203c8d910f5a9cc19a"

  version "0.9.6"

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
