
class projects::ldh {
  kraftwagen::project { 'ldhnew':
    source => 'git@bitbucket.org:lobetdenherrn/website2.git'
  }

  kraftwagen::project { 'ldh':
    source => 'git@bitbucket.org:lobetdenherrn/website.git'
  }
}
