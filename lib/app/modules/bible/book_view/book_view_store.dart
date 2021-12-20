import 'package:mobx/mobx.dart';
import 'package:mybible/app/modules/bible/bible_store.dart';

part 'book_view_store.g.dart';

class BookViewStore = _BookViewStoreBase with _$BookViewStore;

abstract class _BookViewStoreBase with Store {
  final BibleStore bibleStore;

  @observable
  double fontSize = 14.0;

  _BookViewStoreBase(this.bibleStore);

  @action
  changeFont() {
    if (fontSize == 14) {
      fontSize = 16;
    } else if (fontSize == 16) {
      fontSize = 18;
    } else {
      fontSize = 14;
    }

    print(fontSize);
  }

  @action
  changePage(int index) {
    bibleStore.currentChapter = index;
  }
}
