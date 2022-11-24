import 'package:mobx/mobx.dart';
import 'package:mybible/app/modules/bible/bible_store.dart';

part 'book_view_store.g.dart';

class BookViewStore = _BookViewStoreBase with _$BookViewStore;

abstract class _BookViewStoreBase with Store {
  final BibleStore bibleStore;

  @observable
  double fontSize = 16.0;

  _BookViewStoreBase(this.bibleStore);

  @computed
  get getFontSize => fontSize;

  @action
  changeFont() {
    if (fontSize == 16) {
      fontSize = 18;
    } else if (fontSize == 18) {
      fontSize = 20;
    } else {
      fontSize = 16;
    }

    print(fontSize);
  }

  @action
  changePage(int index) {
    bibleStore.currentChapter = index;
  }
}
