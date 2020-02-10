class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv/dv-runtime/"
  head "https://gitlab.com/inivation/dv/dv-runtime.git"
  url "https://gitlab.com/inivation/dv/dv-runtime/-/archive/1.1.0/dv-runtime-1.1.0.tar.gz"
  sha256 "280543f0d4afc567876329e2b1fca6a43c0d8eff86b776c3ee9ef03c1935c800"

  version "1.1.0"

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
