Pod::Spec.new do |s|

  s.name            = 'MSStringifyMacros'
  s.version         = '0.0.3'
  s.license         = { :type => "MIT", :file => "LICENSE" }
  s.summary         = 'A set of macros for simplifying NSUserDefaults.'
  s.description     = <<-DESC
                        MSStringifyMacros provides a convenient shorthand
                        alternative to the normally tedious and potentially error-prone 
                        standard approach to coding for NSUserDefaults and NSCoding.
                    DESC
  s.homepage        = 'https://bitbucket.org/msagal/msstringifymacros'
  s.authors         = { 'Murray Sagal' => 'murraysagal@mac.com' }
  s.source          = { :git => 'https://msagal@bitbucket.org/msagal/msstringifymacros.git', :tag => s.version.to_s }
  s.platform        = :ios
  s.platform        = :osx
  s.source_files    = 'MSStringifyMacros*.h'
  
  s.subspec 'UserDefaults' do |ss|
    ss.source_files = 'MSStringifyMacros_UserDefaults.h'
  end
  
  s.subspec 'Archiving' do |ss|
    ss.source_files = 'MSStringifyMacros_Archiving.h'
  end

end