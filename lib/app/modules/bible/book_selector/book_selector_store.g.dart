// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_selector_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookSelectorStore on _BookSelectorStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_BookSelectorStoreBase.isLoading');

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

  final _$changeVersionAsyncAction =
      AsyncAction('_BookSelectorStoreBase.changeVersion');

  @override
  Future changeVersion(BibleVersion index) {
    return _$changeVersionAsyncAction.run(() => super.changeVersion(index));
  }

  final _$_BookSelectorStoreBaseActionController =
      ActionController(name: '_BookSelectorStoreBase');

  @override
  dynamic changeBookChapter(int book, int chapter) {
    final _$actionInfo = _$_BookSelectorStoreBaseActionController.startAction(
        name: '_BookSelectorStoreBase.changeBookChapter');
    try {
      return super.changeBookChapter(book, chapter);
    } finally {
      _$_BookSelectorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
