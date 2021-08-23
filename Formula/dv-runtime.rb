class DvRuntime < Formula
  desc "C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv/dv-runtime/"
  head "https://gitlab.com/inivation/dv/dv-runtime.git"
  url "https://gitlab.com/inivation/dv/dv-runtime/-/archive/1.4.5/dv-runtime-1.4.5.tar.gz"
  sha256 "be1f209e85e0832f5ee535d72b107fd3dc40a935d0275eef309c7b42a32281da"

  version "1.4.5"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libcaer"
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
