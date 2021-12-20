import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybible/app/modules/bible/book_selector/book_selector_store.dart';
import 'package:mybible/app/modules/bible/book_view/book_view_store.dart';
import 'bible_store.dart';
import 'book_view/book_view.dart';

class BibleModule extends Module {
  final List<Bind> binds = [
    BindInject((i) => BibleStore()),
    BindInject((i) => BookSelectorStore(i<BibleStore>())),
    BindInject((i) => BookViewStore(i<BibleStore>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => BookViewPage()),
  ];
}
