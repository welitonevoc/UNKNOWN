import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybible/app/modules/bible/bible_module.dart';
import 'package:mybible/app/modules/splash/splash_store.dart';

import 'modules/splash/splash_page.dart';

class AppModule extends Module {
  final List<Bind> binds = [
    BindInject((i) => SplashStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/splash', child: (_, __) => SplashPage()),
    ModuleRoute('/bible', module: BibleModule()),
  ];
}
