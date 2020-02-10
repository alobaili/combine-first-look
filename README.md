# combine-first-look
My first look on Combine framework.

[Combine](https://developer.apple.com/documentation/combine) is a declarative Swift API for processing values over time.

## Try the app
You need Xcode 11 or higher. Just clone this project and open it in Xcode, then run the it on iPhone in Simulator.

## The Project
I demonstrate Combine using a simple login screen. The screen has two text fields, one switch, and a login button.
The goal is to enable the login button only when each text field has at least 4 characters and the switch is on.
<p align="center">
<img src="https://lh3.googleusercontent.com/1nE8GbHfI5QoO0rZp8jpZW3wyIBSpTGBM8zbil3_TfmM_Io6EwId8PCdpottCD6mFmmLcfd5pkljOtRE8nLzEM_OQuYE91w0Y8DuShpKONdf2fCUws03Ez-BBlElvia7hC4KaC3OG9fjoTOWwUKKVjNKd_-vnAvtcVWtlpXRBo5lorntaqeAYlz5JtCFvuARPoAl69Bi16VZV0mFuxKr7WcmYrtfqJ743giRVla0aeFjWwU4EFNJWDuWBkpfXgLOZPZqJQlhecOiSdkxZIs8-urEzRrg_NHpn3vJVgIAGpA_d9RV1dAJhsssYGb82XA6T55HiEIJFJD0RXfd7mQjI52fmP0UWECAgn_DFyAG3FNrMK9mGjXeUDEdlwGJJq5XkLc6JgZTYDxo_8Q8mdI93TThj_3fwjCz21ZQT0zoPxPe45NA5-lVlAjH6Bjr5RQTkIbebywWuWUP18CYA0bWmOtMHMMHv3kAd7TxnLxjLxvv_6JczckOt0RR96rBxPhccJpzCx1-o-tp5zgRatTIasWbz6MwgToWfNtejF8riwMWSQ3yZTiMuCLwrBrtzWdxGj12k29gXc2qDhOEI-TeK15lMsLzHifgakBSMiGWpwptv4Xd_84hPq40aUfpu7_uC8_dxitZkIzNLwtxiXB9GMQm5G2XlrWrUCcs4QVl6eSZx9OG4c6pn7o=w238-h480-no">
</p>

I use the `@Published` keyword on three boolean properties for the text fields and switch, which creates a `Piblisher` from the propertry.
Then I create a property `subscriber` of type `AnyCancellable?`. This type automatically cancels the subscription on `deinit` and any subscriber can be defined using this type.
Then I use `Publishers.CombineLatest3` which creates a new `Publisher` by combining the latest values asigned to the three properties,
then I use that publisher to map the three values into one `Bool` that I assign to the `isEnabled` property of `loginButton`.

The `@Published` property wrapper publishes a new value whenever the property value is set. So I make basic `@IBAction` functions for the three controls and use them to set the values for these properties and trigger their respective publishers.
