class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv/dv-runtime/"
  head "https://gitlab.com/inivation/dv/dv-runtime.git"
  url "https://gitlab.com/inivation/dv/dv-runtime/-/archive/1.1.2/dv-runtime-1.1.2.tar.gz"
  sha256 "2646a31cb806eb41fdbb2e73320c9bf593efbfa2ba367c7b4f4ea757d178252c"

  version "1.1.2"

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
