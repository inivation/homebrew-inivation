class Caer < Formula
  desc "Minimal C library to access, configure and get/send AER data from sensors or to/from neuromorphic processors."
  homepage "https://github.com/inilabs/caer/"
  head "https://github.com/inilabs/caer.git"
  url "https://github.com/inilabs/caer/archive/1.1.0.zip"
  sha256 "e313bce07348469004faf0c083cfb7de204d1a266a6c553567fce2abaee2701e"

  version "1.1.0"

  option "with-opencv", "Build with OpenCV support for modules that need it (cameracalibration, framestatistics)."

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libcaer"
  depends_on "boost"
  depends_on "opencv" => :optional

  def install
    args = []

    if build.with? "opencv"
      args << "-DUSE_OPENCV=1"
    end

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
