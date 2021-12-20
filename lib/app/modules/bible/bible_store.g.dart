// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BibleStore on _BibleStoreBase, Store {
  Computed<BookModel?>? _$currentBookComputed;

  @override
  BookModel? get currentBook =>
      (_$currentBookComputed ??= Computed<BookModel?>(() => super.currentBook,
              name: '_BibleStoreBase.currentBook'))
          .value;
  Computed<String>? _$getCurrentBookComputed;

  @override
  String get getCurrentBook =>
      (_$getCurrentBookComputed ??= Computed<String>(() => super.getCurrentBook,
              name: '_BibleStoreBase.getCurrentBook'))
          .value;
  Computed<String>? _$getCurrentVersionComputed;

  @override
  String get getCurrentVersion => (_$getCurrentVersionComputed ??=
          Computed<String>(() => super.getCurrentVersion,
              name: '_BibleStoreBase.getCurrentVersion'))
      .value;

  final _$versionBibleAtom = Atom(name: '_BibleStoreBase.versionBible');

  @override
  BibleVersion get versionBible {
    _$versionBibleAtom.reportRead();
    return super.versionBible;
  }

  @override
  set versionBible(BibleVersion value) {
    _$versionBibleAtom.reportWrite(value, super.versionBible, () {
      super.versionBible = value;
    });
  }

  final _$versionAtom = Atom(name: '_BibleStoreBase.version');

  @override
  List<BookModel> get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(List<BookModel> value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  final _$indexCurrentBookAtom = Atom(name: '_BibleStoreBase.indexCurrentBook');

  @override
  int? get indexCurrentBook {
    _$indexCurrentBookAtom.reportRead();
    return super.indexCurrentBook;
  }

  @override
  set indexCurrentBook(int? value) {
    _$indexCurrentBookAtom.reportWrite(value, super.indexCurrentBook, () {
      super.indexCurrentBook = value;
    });
  }

  final _$currentChapterAtom = Atom(name: '_BibleStoreBase.currentChapter');

  @override
  int? get currentChapter {
    _$currentChapterAtom.reportRead();
    return super.currentChapter;
  }

  @override
  set currentChapter(int? value) {
    _$currentChapterAtom.reportWrite(value, super.currentChapter, () {
      super.currentChapter = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_BibleStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$loadDataAsyncAction = AsyncAction('_BibleStoreBase.loadData');

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  final _$_BibleStoreBaseActionController =
      ActionController(name: '_BibleStoreBase');

  @override
  String getBibleVersions(int index) {
    final _$actionInfo = _$_BibleStoreBaseActionController.startAction(
        name: '_BibleStoreBase.getBibleVersions');
    try {
      return super.getBibleVersions(index);
    } finally {
      _$_BibleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
versionBible: ${versionBible},
version: ${version},
indexCurrentBook: ${indexCurrentBook},
currentChapter: ${currentChapter},
isLoading: ${isLoading},
currentBook: ${currentBook},
getCurrentBook: ${getCurrentBook},
getCurrentVersion: ${getCurrentVersion}
    ''';
  }
}
