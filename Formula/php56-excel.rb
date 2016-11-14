require File.expand_path("/usr/local/Homebrew/Library/Taps/homebrew/homebrew-php/Abstract/abstract-php-extension.rb", __FILE__)

class Php56Excel < AbstractPhp56Extension
  init
  homepage 'https://github.com/iliaal/php_excel'
  url 'https://github.com/iliaal/php_excel/releases/download/Excel-1.0.2-PHP5/excel-1.0.2-php5.tgz'
  head 'https://github.com/iliaal/php_excel.git'
  sha256 '3620527fd821899747f52cfe4bb9e8243c00a5f5ca9c55c5fb320424d2be4673'

  depends_on 'autoconf' => :build
  depends_on 'php56' unless build.include?('without-homebrew-php')
  depends_on 'libxl'

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          "--with-libxl-incdir=#{Formula['libxl'].opt_prefix}/include_c/",
                          "--with-libxl-libdir=#{Formula['libxl'].opt_prefix}/lib/",
			  "--with-libxml-dir=/usr/include/",
                          phpconfig

    system "make"
    prefix.install "modules/excel.so"
    write_config_file if build.with? "config-file"
  end
end
