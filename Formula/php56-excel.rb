require File.expand_path("/usr/local/Homebrew/Library/Taps/homebrew/homebrew-php/Abstract/abstract-php-extension.rb", __FILE__)

class Php56Excel < AbstractPhp56Extension
  init
  homepage 'https://github.com/iliaal/php_excel'
  url 'https://github.com/iliaal/php_excel/archive/1.0.tar.gz'
  head 'https://github.com/iliaal/php_excel.git'
  sha256 'd111b1e5a81a10bc80bf52f305b569125a5f370ffd7c94476f767be8bc81001b'

  depends_on 'autoconf' => :build
  depends_on 'php56' unless build.include?('without-homebrew-php')
  depends_on 'libxl'

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          "--with-libxl-incdir=#{Formula['libxl'].opt_prefix}/include_c/",
                          "--with-libxl-libdir=#{Formula['libxl'].opt_prefix}/lib/",
                          phpconfig

    system "make"
    prefix.install "modules/excel.so"
    write_config_file if build.with? "config-file"
  end
end
