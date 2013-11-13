require 'formula'

HOMEBREW_CASK_VERSION = '0.20.0'

class BrewCask < Formula
  homepage 'https://github.com/Telmate/homebrew-cask/'
  url 'https://github.com/Telmate/homebrew-cask.git', :tag => "v#{HOMEBREW_CASK_VERSION}"

  head 'https://github.com/Telmate/homebrew-cask.git', :branch => 'master'

  skip_clean 'bin'

  def install
    prefix.install 'lib' => 'rubylib'
    inreplace 'bin/brew-cask.rb', '/lib', '/rubylib'

    prefix.install 'Casks', 'bin'
    (bin+'brew-cask.rb').chmod 0755
  end
end
