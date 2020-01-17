class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv/dv-runtime/"
  head "https://gitlab.com/inivation/dv/dv-runtime.git"
  url "https://gitlab.com/inivation/dv/dv-runtime/-/archive/1.0.9/dv-runtime-1.0.9.tar.gz"
  sha256 "e52aea6b4b73400b7f10f32bcd20abb08a2a6779cb7ed4b9f05be1a5d59d97fc"

  version "1.0.9"

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
