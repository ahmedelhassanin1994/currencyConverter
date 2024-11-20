# task
Using TDD (Test Driven Development) and Clean Architecture are two important concepts in software development that help in building high-quality and maintainable applications. And Can Improve Your Development Process Even Further

1-Code Quality: Writing tests first forces you to think through your logic and edge cases upfront. This results in cleaner, more maintainable code.

2-Faster Development: It might sound counterintuitive, but once you get into the TDD rhythm, you’ll find that it actually speeds up your development. Tests act as documentation, and they allow you to quickly identify where things might be breaking.

3-Refactoring with Confidence: With comprehensive test coverage, you can refactor your code confidently, knowing that your tests will catch any unintended side effects.

4-Supports Continuous Integration (CI):TDD integrates well with CI/CD practices. With TDD, each change is backed by a suite of tests that verify code behavior in a CI environment, leading to faster and safer deployments

5-Collaborative Codebase: If you’re working with a team, TDD ensures that your code is easy to understand, modify, and scale without introducing errors.

6-Improved Code Design Over Time:Practicing TDD helps improve code design skills. As developers write tests and make the code work, they gradually learn to write better, cleaner code that is easier to understand and maintain.

In clean code architecture, there are three main layers
* Data
* Domain
* Presentation along with
  common (can also be called as core)

Data
The data layers contains the repository implementation and this layer is closest to actual data sources and is responsible for communication with data sources.

The data layer returns the models and not entities and the model also contains the fromJson and toJson mapper.

Domain
This is innermost layer and will contain the core business logic i.e. usecases and business object also called as entities, the usecase depends on the contract of repository (not implementation)

Presentation
This layer contains all the information about the UI and everything to show to the end user customer. The presentation layer also contains the ViewModel which is the state  and often termed as brain of UI.



[Uploading Clean-Architecture-Flutter-Diagram (1).webp…]()

## Technologies Used
- Android Studio
- Dart
- Retrofit for API integration
- json_serializable
- pretty_dio_logger
- freezed
- get_it //dependency injection
- responsive_sizer
- internet_connection_checker
- hive //cts as a lightweight and fast NoSQL database for local data storage. It allows you to easily store and retrieve data on the device itself, even when offline
- cached_network_image  //provides a robust solution for caching images, thereby improving the performance and user experience of your Flutter applications
- flutter_bloc
- shared_preferences
- bloc_test
- hive_test
- mockito
- build_runner

Flavors are build configurations in Flutter apps that allow developers to create separate environments using the same code base. They allow for customization at runtime based on the defined compile-time configurations.

