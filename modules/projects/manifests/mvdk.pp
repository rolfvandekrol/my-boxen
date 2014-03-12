
class projects::mvdk {
  include imagemagick
  
  kraftwagen::project { 'mvdk':
    source => 'git@bitbucket.org:mariellevandekrol/site.git'
  }
}
