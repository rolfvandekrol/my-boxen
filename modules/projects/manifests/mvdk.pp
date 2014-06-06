
class projects::mvdk {
  include imagemagick
  
  kraftwagen::project { 'mvdk':
    source => 'git@bitbucket.org:mariellevandekrol/site.git'
  }
  kraftwagen::project { 'mvdk2':
    source => 'git@bitbucket.org:mariellevandekrol/site_new.git'
  }
}
