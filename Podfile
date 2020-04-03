# ignore all warnings from all pods
inhibit_all_warnings!

platform :ios, '12.0'

target 'LazyPomodoro' do
  use_frameworks!
  
  pod 'SwiftLint'
  pod 'SwiftGen'

  # core RxSwift
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxDataSources'

  # Community projects
  pod 'Action'
  pod 'NSObject+Rx'

  # Realm database
  pod 'RealmSwift'
  pod 'RxRealm'

  # UI
  pod 'SnapKit'

  target 'LazyPomodoroTests' do
    inherit! :search_paths
  end

  target 'LazyPomodoroUITests' do
    inherit! :search_paths
  end

end
