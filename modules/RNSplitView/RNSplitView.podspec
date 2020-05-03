require 'json'
package = JSON.parse(File.read('../../package.json'))

Pod::Spec.new do |s|
  s.name                      = "RNSplitView"

  s.version                   = package["version"]
  s.license                   = package["license"]
  s.summary                   = package["description"]
  s.authors                   = package["author"]
  s.homepage                  = package["homepage"]

  s.platform                  = :macos, "10.14"
  s.requires_arc              = true

  s.source                    = { :git => package["repository"]["url"], :tag => s.version }
  s.source_files              = "macos/*.{h,m,mm}"

  s.dependency "React"

end
