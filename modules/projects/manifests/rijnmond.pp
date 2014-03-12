class projects::rijnmond {
  voiture::project { 'rijnmond':
    source => "svn+ssh://repos.hoppinger.net/svn/rijnmond/trunk"
  }
}