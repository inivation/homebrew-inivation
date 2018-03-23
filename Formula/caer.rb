class Caer < Formula
  desc "C/C++ framework to process data from neuromorphic sensors."
  homepage "https://github.com/inilabs/caer/"
  head "https://github.com/inilabs/caer.git"
  url "https://github.com/inilabs/caer/archive/1.1.0.zip"
  sha256 "e313bce07348469004faf0c083cfb7de204d1a266a6c553567fce2abaee2701e"

  version "1.1.0"

  option "with-tcmalloc", "Support TCMalloc (Google Perftools) for faster memory allocation."
  option "with-opencv", "Build with OpenCV support for modules that need it (cameracalibration, framestatistics)."
  option "with-visualizer", "Enable Visualizer module (uses SFML C++ library)."

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libcaer"
  depends_on "boost"
  depends_on "libpng"
  depends_on "libuv"
  depends_on "google-perftools" => :optional if build.with? "tcmalloc"
  depends_on "opencv" => :optional
  depends_on "sfml" => :optional if build.with? "visualizer"

  def install
    args = []

    if build.with? "tcmalloc"
      args << "-DUSE_TCMALLOC=1"
    end

    if build.with? "opencv"
      args << "-DUSE_OPENCV=1"
    end

    if build.with? "visualizer"
      args << "-DVISUALIZER=1"
    end

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
