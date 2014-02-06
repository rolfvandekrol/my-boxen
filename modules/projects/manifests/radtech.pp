
class projects::radtech {
  voiture::project { 'radtech':
    source => "svn+ssh://repos.hoppinger.net/svn/radtech/branches/v1.1"
  }
}
