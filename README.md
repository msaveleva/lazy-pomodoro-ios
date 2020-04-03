<p align="left">
    <img src="https://img.shields.io/badge/iOS-12.0+-blue.svg" />
    <img src="https://img.shields.io/badge/Swift-5.0-brightgreen.svg" />
    <a href="https://twitter.com/lyumotech">
        <img src="https://img.shields.io/badge/Contact-@lyumotech-lightgrey.svg?style=flat" alt="Twitter: @lyumotech" />
    </a>
</p>

![title](https://github.com/msaveleva/lazy-pomodoro/blob/master/GithubGraphics/Github%20title%202x.png)

Lazy Pomodoro is a productivity iOS app.
It uses a popular idea of work/rest cycle with predefined time intervals. 


## Main features
![presentation](https://github.com/msaveleva/lazy-pomodoro/blob/master/GithubGraphics/Presentation%202x.png)

#### In progress:
- [ ] Lazy Pomodoro allows not only set up custom intervals for work and breaks but also provides three pre-defined presets of most popular intervals.
- [ ] It is possible to create different projects inside the app, so intervals will be connected with it, which will make calculations of time spend on each task much easier.
- [ ] Intervals goals per project and per day. It is always good to track your progress!
- [ ] A detailed statistic is available for every project and interval for it.

## Project's details
The project uses MVVM architecture with coordinator for managing navigation. View-ViewModel binding implemented with [RxSwift](https://github.com/ReactiveX/RxSwift).

All UI is written in code, [SnapKit](https://github.com/SnapKit/SnapKit) is used for Auto Layout.

Other dependencies:
- [SwiftLint](https://github.com/realm/SwiftLint)
- [SwiftGen](https://github.com/SwiftGen/SwiftGen#installation)

## Building
The project relies on external libraries and required Cocoapods installation.
Run `pod install` project folder and start the project from `.xcworkspace` file.

More cocoapods info could be found [here](https://cocoapods.org).

## About the project
Lazy Pomodoro is being developed as a reference project for MVVM architecture pattern with one-class-navigation-system. 