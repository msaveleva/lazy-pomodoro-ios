platform :ios, '12.0'

inhibit_all_warnings!

target 'LazyPomodoro' do
  use_frameworks!

  # core RxSwift
  pod 'RxSwift', '~> 4.4.1'
  pod 'RxCocoa', '~> 4.4.1'
  pod 'RxDataSources', '~> 3.1.0'

  # Community projects
  pod 'Action', '~> 3.10.0'
  pod 'NSObject+Rx', '~> 4.4.1'
  
  # Realm database
  pod 'RealmSwift', '~> 3.13.1'
  pod 'RxRealm', '~> 0.7.6'

  # UI
  pod 'SnapKit', '~> 4.2.0'

  target 'LazyPomodoroTests' do
    inherit! :search_paths
  end

  target 'LazyPomodoroUITests' do
    inherit! :search_paths
  end

end
