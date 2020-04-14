def install_dependecies
  yield
rescue LoadError => e
  gem_name = e.message.split('--').last.strip
  install_missing_gem(gem_name)

  # retry
  Gem.clear_paths
  puts 'Checking other dependecies ...'
  require gem_name
  retry
end

def install_missing_gem(gem_name)
  install_command = "gem install #{gem_name} --no-rdoc --no-ri"
  puts 'Missing gem: ' + gem_name
  print 'Auto-install it? [Yn] '
  install = gets.strip =~ /n/i
  install ||= 1
  exit(1) if install.zero?
  system(install_command) || exit(1)
end

install_dependecies do
  require 'random_name_generator'
end
