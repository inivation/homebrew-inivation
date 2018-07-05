class Libcaer < Formula
  desc "Minimal C library to access, configure and get data from neuromorphic sensors and processors."
  homepage "https://github.com/inivation/libcaer/"
  head "https://github.com/inivation/libcaer.git"
  url "https://github.com/inivation/libcaer/archive/2.4.2.tar.gz"
  sha256 "96eebab192eac7fa23d5653d9a3e9772eaa7669f0b6bce5f4f7d0cc32c31afb9"

  version "2.4.2"

  option "with-libserialport", "Build with serial port support for eDVS and similar devices."
  option "with-opencv", "Build with OpenCV support for better frame enhancement."

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libusb"
  depends_on "rene-dev/sigrok/libserialport" => :optional
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
