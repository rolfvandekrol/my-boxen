# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.1"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.4"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.7.1"
github "go",          "2.1.0"
github "homebrew",    "1.11.2"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.4"
github "nodejs",      "4.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.7"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "wget", "1.0.0"
github "autoconf", "1.0.0"
github "libtool", "1.0.0"
github "pcre", "1.0.0"
github "libpng", "1.0.0"

github "osx",        "2.2.2"

github "chrome",     "1.1.2"
github "firefox",    "1.1.7"
github "spotify",    "1.0.1"
github "sublime_text_2", "1.1.2"
github "sublime_text_3", "1.0.2", :repo => "jozefizso/puppet-sublime_text_3"
github "sequel_pro", "1.0.1"
github "flux", "0.0.1", :repo => "technicalpickles/puppet-flux"
github "skype", "1.0.8"
github "inkscape", "1.0.3"

github "php", "1.1.4.1006", :repo => "rolfvandekrol/puppet-php"
github "mysql", "1.2.0"
github "sourcetree", "1.0.0"
github "iterm2", "1.0.6"
github "imagemagick", "1.2.1"

github "zsh", "1.0.0"
github "ohmyzsh", "0.0.1", :repo => "haelmy/puppet-ohmyzsh"
