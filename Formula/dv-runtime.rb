class DV-Runtime < Formula
  desc "Event-based processing framework for neuromorphic devices, written in C/C++, targeting embedded and desktop systems."
  homepage "https://gitlab.com/inivation/dv-runtime/"
  head "https://gitlab.com/inivation/dv-runtime.git"
#  url "https://gitlab.com/inivation/"
#  sha256 ""

  version "0.8"

  option "with-tcmalloc", "Support TCMalloc (Google Perftools) for faster memory allocation."

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libcaer"
  depends_on "boost"
  depends_on "opencv"
  depends_on "google-perftools" => :optional if build.with? "tcmalloc"

  def install
    args = []

    if build.with? "tcmalloc"
      args << "-DENABLE_TCMALLOC=1"
    end

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
