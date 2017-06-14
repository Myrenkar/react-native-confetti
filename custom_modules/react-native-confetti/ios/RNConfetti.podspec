
require "json"
package = JSON.parse(File.read(File.join(__dir__, '../', 'package.json')))

Pod::Spec.new do |s|
  s.name          = package['name']
  s.version       = package["version"]
  s.summary       = package['description']
  s.requires_arc  = true
  s.author        = { 'Myrenkar' => 'piotr.torczynski@gmail.com' }
  s.license       = package["license"]
  s.homepage      = package["homepage"]
  s.source        = { :git => 'https://github.com/myrenkar/react-native-confetti.git' }
  s.platform      = :ios, '7.0'
  s.dependency      'SAConfettiView'

end
