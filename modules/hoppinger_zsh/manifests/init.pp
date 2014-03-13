class hoppinger_zsh {
  # My shell
  include zsh
  include ohmyzsh

  file { "/Users/${::luser}/.zshrc":
    source => "puppet:///modules/hoppinger_zsh/.zshrc",
    require => Repository['robbyrussell/oh-my-zsh'],
  }

  file { "/Users/${::luser}/.oh-my-zsh/custom/hoppinger.zsh-theme":
    source => 'puppet:///modules/hoppinger_zsh/hoppinger.zsh-theme',
    require => Repository['robbyrussell/oh-my-zsh'],
  }

  file { "/Users/${::luser}/.oh-my-zsh/lib/00-boxen.zsh":
    content => "export LC_ALL=en_US.UTF-8\nexport LANG=en_US.UTF-8\n\nsource ${boxen::config::home}/env.sh",
    require => Repository['robbyrussell/oh-my-zsh'],
  }
}