class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv-runtime/"
  head "https://gitlab.com/inivation/dv-runtime.git"
  url "https://gitlab.com/inivation/dv-runtime/-/archive/0.9.3/dv-runtime-0.9.3.tar.gz"
  sha256 "97d236f879c2951bf273f8061ea48e7627b444690f37a8795595a2a4040d35f2"

  version "0.9.3"

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
