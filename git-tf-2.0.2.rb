require 'formula'

class GitTf202 < Formula
  homepage 'http://gittf.codeplex.com/'
  url 'http://download.microsoft.com/download/A/E/2/AE23B059-5727-445B-91CC-15B7A078A7F4/git-tf-2.0.2.20130214.zip'
  sha1 '889c1bba6aba892e570a18a386654a50293efbd0'

  conflicts_with 'git-tf', :because => 'two different versions of the same library'

  def install
    libexec.install 'git-tf'
    libexec.install 'lib'
    (libexec + "native").install 'native/macosx'
    bin.write_exec_script libexec/'git-tf'
    (share/'doc/git-tf').install Dir['Git-TF_*'] + Dir['ThirdPartyNotices*']
  end

  test do
    system "#{bin}/git-tf"
  end
end
