class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv/dv-runtime/"
  url "https://release.inivation.com/runtime/dv-runtime-1.7.1.tar.gz"
  sha256 "09acc631d06f1f1866fe1140b67f10254f5dfc1c34a9ce886b2450c89203e26d"

  version "1.7.1"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
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
