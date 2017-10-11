Pod::Spec.new do |s|
	s.name = 'Router'
	s.version = '0.0.1'
  	s.ios.deployment_target = '11.0'
  	s.summary = 'By far the most fantastic service router I have seen in my entire life over Swift languege. No joke.'
 
  	s.description = <<-DESC
  	This fantastic service router allows you to connect with different API REST from entire world, yes... FROM ENTIRE WORLD!.
  	DESC
 
  	s.homepage = 'http://irongit.southcentralus.cloudapp.azure.com/dioses/lib-router'
  	s.license = { :type => 'MIT', :file => 'LICENSE.md' }
  	s.author = { 'specktro' => 'specktro@nonull.mx' }
  	s.source = { :git => 'http://irongit.southcentralus.cloudapp.azure.com/dioses/lib-router.git', :tag => "#{s.version}" }
  	s.dependency 'Alamofire', '> 4.5'
 	
  	s.source_files = 'Router/Router.swift'
end
