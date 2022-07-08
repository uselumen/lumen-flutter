# Lumen

The Lumen JavaScript SDK allows you to seamlessly identify and track user attributes and events on your client. Plus other perks.

## Features

- Identify users
- Track user events
- Update user properties

## Getting started

- Setup your [Lumen](https://uselumen.co) account.
- Retrieve your API key
- Install the plugin

```sh
flutter pub add
```

## Usage

<!--
TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. -->

### Initialize the project

```dart
import 'package:lumen_flutter/lumen_flutter.dart';

final lumen = Lumen("apiKey");
```

### Identify a user

```dart
final identifyData = IdentifyData(
    email: "johndoe@gmail.com",
    first_name: "john",
    last_name: "doe",
    phone_number: "07053643618");

lumen.identify("unique identifier", identifyData);
```

### Track an event

```dart
final customTrackProperties = {"value": "1233"};
lumen.track("unique identifier", "event name ->", customTrackProperties);
```

<!--
## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more. -->
