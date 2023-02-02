class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv/dv-runtime/"
  url "https://release.inivation.com/runtime/dv-runtime-1.6.1.tar.gz"
  sha256 "4611f9138db330795217a1564c12e68ba767a42ad83834f07f96b85b27539cb3"

  version "1.6.1"

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
