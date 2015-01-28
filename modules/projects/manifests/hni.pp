
class projects::hni {
  kraftwagen::project { 'hni':
    source => 'hoppinger/hni-website',
    server_aliases => "*.bla.dev"
  }
}
