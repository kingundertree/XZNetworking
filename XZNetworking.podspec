Pod::Spec.new do |s|

  s.name         = "XZNetworking"
  s.version      = "1.0"
  s.summary      = ""

  s.description  = ""

  s.homepage     = "https://github.com/kingundertree/XZNetworking"

  s.license      = "MIT (example)"
  s.author             = { "徐山" => "kingundertree@163.com" }
  s.source       = { :git => "https://github.com/kingundertree/XZNetworking.git" }

  s.source_files  = 'XZNetworking', 'XZNetworking/XZNetwork/*.{h,m}'


  s.subspec 'Assist' do |ss|
      ss.source_files = 'XZNetworking/XZNetwork/Assist/*.{h,m}'
  end

  s.subspec 'Category' do |ss|
      ss.source_files = 'XZNetworking/XZNetwork/Category/*.{h,m}'
      ss.frameworks = 'Security'
  end

  s.subspec 'Components' do |ss|
      ss.source_files = 'XZNetworking/XZNetwork/Components/*.{h,m}'
      ss.frameworks = 'SystemConfiguration'
  end

  s.subspec 'Debug' do |ss|
      ss.source_files = 'XZNetworking/XZNetwork/Debug/*.{h,m}'
  end

  s.subspec 'XZNetService' do |ss|
      ss.source_files = 'XZNetworking/XZNetwork/XZNetService/*.{h,m}'

      ss.subspec 'ServiceConfig' do |sss|
          sss.source_files = 'XZNetworking/XZNetwork/XZNetService/ServiceConfig/*.{h,m}'
      end
  end

  s.subspec 'XZResponse' do |ss|
      ss.source_files = 'XZNetworking/XZNetwork/XZResponse/*.{h,m}'
  end  

  s.subspec 'XZSignatureGenerator' do |ss|
      ss.source_files = 'XZNetworking/XZNetwork/XZSignatureGenerator/*.{h,m}'
  end  

end
