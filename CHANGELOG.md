## 2.0.0
* Nullsafety support
* Dart >= 2.12.0 required
* Provider >= 5.0.0 required

## 1.5.1-nullsafety
* Use version range for provider dependency

## 1.5.0-nullsafety
* Nullsafety migration

## 1.4.1
* Make getController called **before** getProviders in case we want to inject controller using Provider

## 1.4.0
* Generics improvements

## 1.3.0
* Controlled widget is accessible throught its controller by `widget` attribute
* Controlled widget can be strongly type by `SwcController<MyWidget>`

## 1.2.0
* Make getController and getProviders called only once for both SwcStateless and SwcStateful widgets


## 1.1.0
* Add constructor with optional Key parameter for both SwcStateless and SwcStateful widgets


## 1.0.1
* Fix immutability warning when using SwcStatelessWidget


## 1.0.0
* Add tests
* Null safe internal controllers' calls
* Minor wrapper optimizations


## 0.0.1
* Initial release
