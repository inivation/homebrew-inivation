class CaerModulesDynapse < Formula
  desc "Modules to work with aiCTX's Dynap-SE neuromorphic processor."
  homepage "https://github.com/inivation/caer-modules-dynapse/"
  head "https://github.com/inivation/caer-modules-dynapse.git"

  version "1.2.1"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "caer"

  def install
    args = []
    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
