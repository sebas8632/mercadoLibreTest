# mercadoLibreTest

> mercadoLibreTest is an iOS app develop with swift and having a VIPER architecture, on it you could find a specific implementation respecting SOLID principles, Protocol-Oriented Programming and a bunch of topic related with Swift programming. In the next lines we are going to explain each part of this project.

## Architecture VIPER

VIPER is an application of Clean Architecture to iOS apps. The word VIPER is a backronym for View, Interactor, Presenter, Entity, and Routing. Clean Architecture divides an app’s logical structure into distinct layers of responsibility. This makes it easier to isolate dependencies (e.g. your database) and to test the interactions at the boundaries between layers. [Architecting iOS Apps with VIPER].

## Frameworks
In this section we are going to talk about the frameworks which we have used. In this project we have used personal and third party libraries.

### Personal frameworks
- [JSFSNetwork](https://github.com/sebas8632/JSFSNetwork): This framework represent the entire networking layer, this  framework give us a way to define the API services through protocols defined and a customized way to request data. The main goal of having this framework separated from the main project is could delegate the networking responsibility a specific project and re use in every project need it.
- [JSFSUIModule](https://github.com/sebas8632/JSFSUIModule): This framework is **under construction**, so at the moment give us a declarative way to configurate each view or component on our app through autoLayout.
- [JSFSPopUps](https://github.com/sebas8632/JSFSPopUps): This framework is **under construction** allows to get a configurable pop up to show message. In this approach, we used this framework to show the errors.

### Third Party Frameworks
- [Skeleton View](https://github.com/Juanpe/SkeletonView): This framework allows us show a skeleton while a view is charging.
- [Kingfisher](https://github.com/onevcat/Kingfisher): This frameworks allows us manage the image downloading in an easy way.

## Installation

This project require  `Xcode 12.0`, `Swift 5` and should be run on `iOS 14.0`.

1. Install [Swiftlint](https://github.com/realm/SwiftLint).
2. Install [Carthage](https://github.com/Carthage/Carthage).
-- Then, you should execute this command.
    ```sh
    carthage update
    ```

    If you have this error.
    ```sh
         Build Failed
         Task failed with exit code 1:
         /usr/bin/xcrun lipo -create
	```
	you should follow these steps . [Carthage error lipo -create](https://github.com/Carthage/Carthage/issues/3019)
	
	1. Added a file called `tmp.xcconfig` to the project and added the excludes:
	```
	EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64=arm64 arm64e armv7 armv7s armv6 armv8
    
    EXCLUDED_ARCHS=$(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT))
	```
	2. Then execute, these commands. 
	```sh
    # This export fixes an issues with the latest Xcode beta.
    export XCODE_XCCONFIG_FILE=$PWD/tmp.xcconfig
    carthage update --platform iOS --no-use-binaries --cache-builds
	```
	3. To finish, you should execute `carthage update`

3. Then, you should `run` the app.

## Evidence
On this Section we are going to watch the app running.

This app was developed taking account the internationalization, so in this example we could see the app running out in english and spanish.

| English | Spanish |
| ------- | ------- |
|![alt text](https://github.com/sebas8632/mercadoLibreTest/blob/master/meli_english_gif.gif) | ![alt text](https://github.com/sebas8632/mercadoLibreTest/blob/master/meli_spanish_gif.gif)|

## What's next?
> Having this approach, the next challenge is separate each module in a specific framework to avoid having a big monolithical project, instead of it, we could have a group of frameworks where each one should have a specific domain responsability.
