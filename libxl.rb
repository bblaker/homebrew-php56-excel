require 'formula'

class Libxl < Formula
  homepage 'http://www.libxl.com/'
  url 'http://www.libxl.com/download/libxl-mac-3.7.1.tar.gz'
  sha256 'cfbdff044394726af167906288d909f496994f62f406359ab175aa9adf8f05b3'

  def install
    lib.install 'lib/libxl.dylib'
    include.install Dir["include_c/*.h"]
  end

  def caveats; <<-EOS
    LibXl will write a banner in the first row of each spreadsheet and it will be able to
    read only 100 cells (first row is unavailable). Buy a license key to remove banner and reading restriction:
      http://libxl.com/purchase.html
    EOS
  end
end
