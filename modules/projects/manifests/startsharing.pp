
class projects::startsharing {
  kraftwagen::project { 'startsharing':
    source => 'hoppinger/startsharing-kw.git'
  }

  kraftwagen::project { 'sallcon':
    source => 'hoppinger/startsharing-kw.git'
  }
}