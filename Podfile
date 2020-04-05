# ignore all warnings from all pods
inhibit_all_warnings!

platform :ios, '12.0'

target 'LazyPomodoro' do
  use_frameworks!
  
  pod 'SwiftLint', '~> 0.39'
  pod 'SwiftGen', '~> 6.1'

  # core RxSwift
  pod 'RxSwift', '~> 5.1'
  pod 'RxCocoa', '~> 5.1'

  # Realm database
  pod 'RealmSwift', '~> 4.4'

  # UI
  pod 'SnapKit', '~> 5.0'

  target 'LazyPomodoroTests' do
    inherit! :search_paths
  end

end
