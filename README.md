<p align="center">
  <a href="https://uselumen.co">
    <img src="https://user-images.githubusercontent.com/43097772/178112983-d1f040da-6580-473f-b1cc-6083a0c0c95e.png" height="60">
  </a>
  <p align="center">Data-driven automation messaging for growth and retention.</p>
</p>

# Lumen

The Lumen Flutter plugin allows you to seamlessly identify and track user attributes and events on your app. Plus other perks.

## Features

- Identify users
- Track user events
- Update user properties

## Getting started

- Setup your [Lumen](https://uselumen.co) account.

- Retrieve your API key.

> Follow the steps below to retrieve your api key.
>
> - Log in to your lumen dashboard.
> - Navigate to Settings
> - Select the API Key tab to view and copy your key.

- Install the plugin

```sh
flutter pub add lumen
```

## Usage

<!--
TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. -->

#### Initialize the project

```dart
import 'package:lumen/lumen.dart';

final lumen = Lumen("apiKey");
```

#### Identify a user

```dart
final identifyData = IdentifyData(
    email: "johndoe@example.com", // required
    first_name: "john",
    last_name: "doe",
    phone_number: "0123456789",
    device_id: "device ID");

lumen.identify("unique user identifier", identifyData);
```

#### Track an event

After identifying users, you can now capture their actions like "Product Clicked" or "Product Viewed" with other custom properties.

```dart
final customTrackProperties = {"value": "1233"};

lumen.track("unique user identifier", "event name", customTrackProperties);
```

## Contributing

1. Fork it
2. Clone your fork (`git clone git@github.com:MY_USERNAME/lumen-flutter.git && cd lumen-flutter`)
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'feat: Added some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

<!--
## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more. -->
