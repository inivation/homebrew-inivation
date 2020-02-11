class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv/dv-runtime/"
  head "https://gitlab.com/inivation/dv/dv-runtime.git"
  url "https://gitlab.com/inivation/dv/dv-runtime/-/archive/1.1.1/dv-runtime-1.1.1.tar.gz"
  sha256 "cb29fdcd3b314300ec0e2152dc5e2b9212bd4cd401ad874af771c6504de4cc67"

  version "1.1.1"

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
