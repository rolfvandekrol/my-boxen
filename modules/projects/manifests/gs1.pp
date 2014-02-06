
class projects::gs1 {
  kraftwagen::project { 'gs1':
    source => 'hoppinger/gs1'
  }

  php::extension::ssh2 { 'ssh2 for gs1':
    php => '5.3.27'
  }
}
