Pod::Spec.new do |s|
  s.name                  = 'Gooey'
  s.version               = '1.1.0'
  s.summary               = 'UIKit extensions and helpers to make everyday iOS development simpler.'
  s.description           = "UIKit extensions for simplifying development. Includes extensions for handling safeAreaLayoutGuide with backwards compatibility, less verbose reusable views, and more."
  s.license               = { type: 'MIT', file: 'LICENSE' }
  s.author                = { 'Duet Health': 'info@duethealth.com' }
  s.social_media_url      = 'https://twitter.com/DuetHealth'
  s.platform              = :ios, '9.0'
  s.source                = { git: 'https://github.com/DuetHealth/Gooey.git', tag: "#{s.version}" }
  s.homepage              = "#{s.source[:git]}"
  s.source_files          = 'Gooey/Sources/**/*.{h,m,swift}'
  s.requires_arc          = true
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.0'
end

