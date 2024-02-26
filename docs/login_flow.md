

# Login flow

The log in is started from the `LoginPage` where the user can select which way to log in through, with current options being `Google`, `Apple`,  `Facebook`, and `Email and password`.  
The `Email and password` will open another custom page (`LoginWithEmailAndPasswordPage`) where the user fills in their information, and the other 3 starts a flow implemented by the `google_sign_in` package.


Once the `Next` button is clicked on the `LoginWithEmailAndPasswordPage`, it will emit a `EmailAndPasswordSubmitted` event to `LoginBloc`, which will then call the `logInWithEmailAndPassword` method in the `UserRepository` class.

The `UserRepository` class exposes a `Stream<User>` for the logged in user, which will either returns the logged in user or `User.anonymous` after logging out.

The `User.anonymous` has an `id` that will be set to `anonymous`, so it is a little easier to identify.


After successfully logging in, a listener in `AppBloc` will call the `_userChanged` method, which in turn emits 
a `AppUserChanged(user)` event. That is then in turn picked up by the `_onUserChanged` method.

Currently that method is then trying to read user information from the Firestore document `users/$userId` 
and populate the `User` class, and then emits the `AppState.authenticated` event with that `User` object.