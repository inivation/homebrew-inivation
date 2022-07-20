class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv/dv-runtime/"
  url "https://release.inivation.com/runtime/dv-runtime-1.5.3.tar.gz"
  sha256 "cc02c637e97140980e485af194a2e49fae5c10bb0f44ec4d98f343b8c42b1f1b"

  version "1.5.3"

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

    if !OS.mac? || !Hardware::CPU.arm?
      # Not working on Apple M1 currently.
      args << "-DENABLE_TCMALLOC=1"
    end

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
