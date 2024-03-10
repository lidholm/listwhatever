
# App structure

## Entering point: `main_development.dart`/`main_production.dart`

Can initialize objects that would be different depending on if running in production mode or development mode
and will then call `bootstrap.dart` and can pass those objects in.

## `bootstrap.dart`

Initializes `Bloc`, `Firebase`, local storage, etc and then calls `runApp` with `App` as an argument.

## App

Initializes all repositories and services, as well as setting up `MultiRepositoryProvider` and `MultiBlocProvider`.
It also wraps the code in an `AuthenticatedUserListener` that is responsible for listening to when the user changes, i.e. logs in or out and then calling whatever code that needs to know about it, mainly different services.
There is also a listener for `ToOnScreenLogsListener` that can listen to errors and display them.

Finally it is also creating the GoRouter object by getting the different routes from `routes.dart` and basic set up from `getRouterProviderInformation()`. It also uses the redirect function from `AppRedirect.dart`.

