class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv/dv-runtime/"
  url "https://release.inivation.com/runtime/dv-runtime-1.6.2.tar.gz"
  sha256 "9e04e9896e5456d1a1e8e072123abdfe81d94c253c2f7ea0e500e1549f6d2948"

  version "1.6.2"

  patch do
    url "https://gitlab.com/inivation/homebrew-inivation/-/raw/master/Formula/dv-runtime-boost-filesystem-1.85-fix.patch"
    sha256 "f574eedce8ce3c325afc7e45830e56e2502c57ce6c8f715019db511bd96b7564"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libcaer"
  depends_on "dv-processing"
  depends_on "boost"
  depends_on "openssl"
  depends_on "opencv"
  depends_on "lz4"
  depends_on "zstd"
  depends_on "fmt"
  depends_on "aravis"
  depends_on "ffmpeg"
  if !OS.mac? || !Hardware::CPU.arm?
    # Not working on Apple M1 currently.
    depends_on "google-perftools"
  end

  def install
    args = []

    if OS.mac? && Hardware::CPU.arm?
      # Not working on Apple M1 currently.
      args << "-DDVR_ENABLE_TCMALLOC=OFF -DDVR_ENABLE_PROFILER=OFF"
    end

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
