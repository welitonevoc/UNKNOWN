import 'package:mobx/mobx.dart';
import 'package:mybible/app/core/models/book_model/book_model.dart';
import 'package:mybible/app/modules/bible/bible_store.dart';

import '../bible_version_enum.dart';

part 'book_selector_store.g.dart';

class BookSelectorStore = _BookSelectorStoreBase with _$BookSelectorStore;

abstract class _BookSelectorStoreBase with Store {
  final BibleStore bibleStore;

  @observable
  bool isLoading = false;

  _BookSelectorStoreBase(this.bibleStore);

  @action
  changeBookChapter(int book, int chapter) {
    isLoading = true;
    bibleStore.indexCurrentBook = book;
    bibleStore.currentChapter = chapter;
    isLoading = false;
  }

  @action
  changeVersion(BibleVersion index) async {
    isLoading = true;
    bibleStore.versionBible = index;
    await bibleStore.loadData();
    isLoading = false;
  }
}
