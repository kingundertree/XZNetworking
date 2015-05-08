Pod::Spec.new do |s|

  s.name         = "XZNetworking"
  s.version      = "1.0"
  s.summary      = ""

  s.description  = ""

  s.homepage     = "https://github.com/kingundertree/XZNetworking"

  s.license      = "MIT (example)"
  s.author             = { "徐山" => "kingundertree@163.com" }
  s.source       = { :git => "https://github.com/kingundertree/XZNetworking.git" }

  s.source_files  = 'XZNetworking', 'XZNetworking/XZNetworking/*.{h,m}'


  s.subspec 'Assist' do |ss|
      ss.source_files = 'XZNetworking/XZNetworking/Assist/*.{h,m}'
  end

  s.subspec 'Category' do |ss|
      ss.source_files = 'XZNetworking/XZNetworking/Category/*.{h,m}'
  end

  s.subspec 'Components' do |ss|
      ss.source_files = 'XZNetworking/XZNetworking/Components/*.{h,m}'
  end

  s.subspec 'Debug' do |ss|
      ss.source_files = 'XZNetworking/XZNetworking/Debug/*.{h,m}'
  end

  s.subspec 'ServiceConfig' do |ss|
      ss.source_files = 'XZNetworking/XZNetworking/ServiceConfig/*.{h,m}'
  end

  s.subspec 'XZNetService' do |ss|
      ss.source_files = 'XZNetworking/XZNetworking/Debug/*.{h,m}'

      ss.subspec 'ServiceConfig' do |sss|
          sss.source_files = 'XZNetworking/XZNetworking/XZNetService/ServiceConfig/*.{h,m}'
      end
  end

  s.subspec 'XZResponse' do |ss|
      ss.source_files = 'XZNetworking/XZNetworking/XZResponse/*.{h,m}'
  end  

  s.subspec 'XZSignatureGenerator' do |ss|
      ss.source_files = 'XZNetworking/XZNetworking/XZSignatureGenerator/*.{h,m}'
  end  

end
