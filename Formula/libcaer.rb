class Libcaer < Formula
  desc "Minimal C library to access, configure and get data from neuromorphic sensors and processors."
  homepage "https://gitlab.com/inivation/dv/libcaer/"
  url "https://release.inivation.com/libcaer/libcaer-3.3.16.tar.gz"
  sha256 "23e7e7ec904c8a1f24c2b952a4cc338c5355cf8ed7a81cf4c46f5d689aba1dc7"

  version "3.3.16"

  option "with-libserialport", "Build with serial port support for eDVS and similar devices."
  option "with-opencv", "Build with OpenCV support for better frame enhancement."

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libusb"
  depends_on "libserialport" => :optional
  depends_on "opencv" => :optional

  def install
    args = []

    if build.with? "libserialport"
      args << "-DENABLE_SERIALDEV=1"
    end

    if build.with? "opencv"
      args << "-DENABLE_OPENCV=1"
    end

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end

  test do
    cflags = ["-pedantic", "-Wall", "-Wextra", "-O2", "-D_DEFAULT_SOURCE=1"]

    # C API
    (testpath/"test.c").write <<-EOS.undent
      #include <libcaer/devices/dvs128.h>

      int main()
      {
        caerDeviceHandle handle = caerDeviceOpen(1, CAER_DEVICE_DVS128, 0, 0, NULL);
        return EXIT_SUCCESS;
      }
    EOS
    system ENV.cc, "test.c", *cflags, "-std=c11", "-lcaer", "-o", "test1"
    system "./test1"

    # C++ bindings
    (testpath/"test.cpp").write <<-EOS.undent
      #include <libcaercpp/devices/dvs128.hpp>

      int main()
      {
        try {
          libcaer::devices::dvs128 dvs128Handle = libcaer::devices::dvs128(1, 0, 0, "");
        } catch (const std::runtime_error &e) {
          // Exception is expected, as there is likely no device plugged.
        }
        return EXIT_SUCCESS;
      }
    EOS
    system ENV.cxx, "test.cpp", *cflags, "-std=c++11", "-lcaer", "-o", "test2"
    system "./test2"
  end
end
