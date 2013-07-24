version = "2.0"
arch = kernel['machine'] =~ /x86_64/ ? "amd64" : "i386"

default[:pypy] = {
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
    :lib_filename => "pypy-#{version}-lib.deb",
    :installation_dir => "/usr"
  },
  'distribute_script_url' => "http://python-distribute.org/distribute_setup.py",
  'distribute_option' => {
    'download_base' => "https://pypi.python.org/packages/source/d/distribute/"
  }
}
