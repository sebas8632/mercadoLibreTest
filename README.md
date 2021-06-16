
## Description of the problem and solution
Mercado Libre is looking for a small but scalable app to consume its searching web services. They are providing its API Documentation to get information about products and show easily through an iOS App.
> Solution focused on iOS(Swift) Technology.
> mercadoLibreTest is an iOS app develop with swift and having a VIPER architecture. On it you could find a specific implementation respecting SOLID principles, Protocol-Oriented Programming and a bunch of topic related with Swift programming. In the next lines we are going to explain each part of this project.

## Technical Choices
In this section i'm going to explain briefly why i choose this architecture, principles, libraries or frameworks.

1. the architecture i've choose is VIPER, because allow us to create and testable and scalable app, and separating each layer allows having single responsibility in each layer, avoiding coupled code.

2. I've avoided use the iOS interface builder because for experience working in large and scalable projects, working with this builder generate a headache through the time, specifically because the IDE generates large XML files which in git conflicts when you are creating your pull request or your merge. So, i prefer create each view through code with UIKit components and AutoLayout(Constraints), everything in code.

3. To avoided a monolithic project, I've decided to use an modular architecture approach, just to avoid a large project with a lot of non-domain layers, for example a networking layer. Also, this approach allow us to be focus in business rules and respect the single responsibility principle.
Having external modules, give us the opportunity to decouple the infrastructure layer form the business layer, and allow us to reuse this infrastructure layer in different projects, giving us a timing advantage to develop our projects.

4. Having my own libraries eliminates the possibility of having a dependency on a third-party developer, so, I won't be worried about external updates and my product will be totally autonomous.

5. Defining an Error Manager to handle errors in each layer, so help us to manage UI, business or networking errors in our app.


## Trade-offs

Taking into account this project was created in practical  terms and with a specific deadline, i think that could be pretty cool make a refactor to technical trends.

1. Defining a reactive architecture to manage the state of the app through messages or notifications ( RxSwift, Combine).
2. Create view and ui components through a declarative way  like SwiftUI it is. This option help us to build views faster than UIKit.

Also, to get more control on the app behave, we could add Firebase Analytics and logs frameworks like sentry to logged each error or trace in our app, or if you want a custom solution, i think that we could create a log solution with AWS (Cloudwatch, lambdas, AppSync, GraphQL).

Finally, would be interesting define a CI/CD solution with a CI Server like Jenkins or CircleCI, SonarQube and Fastlane to 
 integrate and deploy the builds automatically on Apple Store avoiding human errors in this process.

# Technical Approach extended

## Architecture VIPER

VIPER is an application of Clean Architecture to iOS apps. The word VIPER is a backronym for View, Interactor, Presenter, Entity, and Routing. Clean Architecture divides an app’s logical structure into distinct layers of responsibility. This makes it easier to isolate dependencies (e.g. your database) and to test the interactions at the boundaries between layers. [Architecting iOS Apps with VIPER](https://www.objc.io/issues/13-architecture/viper/).
![alt text](https://miro.medium.com/max/1021/1*6W73TuYu1DWi9JY4_Uh8aA.png)

This architecture is conformed by 5 layers which have single responsibilities, which represent an opportunity to have a project decoupled, testable, and scalable.

### View
> This layer is responsible to manage the view and the view controller, which allows to have centralized all the components and their behavior. This layer have their UIView components and UIViewControllers.

### Presenter
> The presenter layer is responsible to manage the communication between the View layer, Router layer and Interactor layer. Its main function is handle each visual request, retrieve information from interactor layer or, route the actual view to another one with the Router.

### Router
> This layer is responsible to manage the communication between modules, its allows us changing between views and, create modules for each feature on the app.

### Interactor
> The interactor is the main integral layer, because on it we could manage all the business logic and have communication with the data modules which retrieve us data from local or remote repositories.

### Entity 
> Entity layer provides a model which interactor use to create objects from the fetched data. The Entity is probably the simplest element inside a VIPER structure.

## Good Practices
With the following practices, we've achieved create a product with highly quality.
- **Clean code**
- **SOLID Principles**
- **DRY Principle**
- **Dependency Injection**
- **Modularized architecture**
- **TDD**
- **BDD**

## Code Quality
In this project we've been working a lot in quality process, integrating testing practices to generate code quality and 
 app behavioral quality. The following practices has been added to achieved it.
 
 ### Code Quality & Code Security
 
 > Through solutions like Swiftlint, we assure that our code have the correct style and conventions to write code, so, this approach is really useful to avoid have code unmaintainable and violating the community standards.
 
 ### Testing
 
 > In this project we use TDD(Test Driven Development) to focus on the quality project and developing our features in a defensive way.
Also, we implement BDD(Behavior Driven Development) conventions to be clearness with the unit test behaviour.

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
