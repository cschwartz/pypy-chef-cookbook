version = "2.0"
arch = kernel['machine'] =~ /x86_64/ ? "amd64" : "i386"

default[:pypy] = {
  :tarball => {
    :version => version,
    :arch    => arch,
    :url     => if arch == "i386"
                  "https://bitbucket.org/pypy/pypy/downloads/pypy-#{version}-linux.tar.bz2"
                else
                  "https://bitbucket.org/pypy/pypy/downloads/pypy-#{version}-linux64.tar.bz2"
                end,
    :filename     => if arch == "i386"
                       "pypy-#{version}-linux.tar.bz2"
                     else
                       "pypy-#{version}-linux64.tar.bz2"
                     end,
    :dirname          => "pypy-#{version}",
    :installation_dir => "/usr/local/pypy"
  },
  :deb => {
    :version      => "#{version}.0",
    :dirname      => "pypy-#{version}.0",
    :url          => if arch == "i386"
                       "http://people.debian.org/~stefanor/pypy/wheezy/pypy_#{ version }.0+dfsg-1~bpo70+1~sr1_i386.deb"
                     else
                       "http://people.debian.org/~stefanor/pypy/wheezy/pypy_#{ version }.0+dfsg-1~bpo70+1~sr1_amd64.deb"
                     end,
    :lib_url      => "http://people.debian.org/~stefanor/pypy/wheezy/pypy-lib_#{ version }.0+dfsg-1~bpo70+1~sr1_all.deb",
    :filename     => if arch == "i386"
                       "pypy-#{version}-linux.deb"
                     else
                       "pypy-#{version}-linux64.deb"
                     end,
    :dirname      => "pypy-#{version}",
    :lib_filename => "pypy-#{version}-lib.deb"
    :installation_dir => "/usr"
  }
}
