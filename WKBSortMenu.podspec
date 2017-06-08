
Pod::Spec.new do |s|

  #私有库名称
  s.name         = "WKBSortMenu"
  #私有仓库版本号
  s.version      = "0.0.1"
  #私有仓库简介(终端中pod search显示的简介)
  s.summary      = "封装的排序筛选类目框"
  #私有库详细介绍,github仓库主页显示
  s.description  = <<-DESC
  封装的排序筛选类目框,支持cocoaPods导入,有什么问题下方留言,我会及时修正.
                   DESC
  #github上的地址
  s.homepage     = "https://github.com/iOSwkb/WKBSortMenu"
  #私有仓库需要的证书
  s.license      = "MIT"
  #作者,填写注册邮箱和用户名
  s.author             = { "iOSwkb" => "614034542@qq.com" }
  #github地址
  s.source      = {:git => "https://github.com/iOSwkb/WKBSortMenu.git", :tag => s.version}
  #本地文件路径
  s.source_files = "WKBSortMenu/*"
  #三方库所支持平台及版本
  s.platform     = :ios
  #自动管理内存
  s.requires_arc = true
  s.dependency 'Masonry'

end
