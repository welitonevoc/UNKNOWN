
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  _SplashStoreBase() {

    new Future.delayed(new Duration(seconds: 2)).then((value) => {
      Modular.to.pushReplacementNamed('/bible/')
    });
  }
}