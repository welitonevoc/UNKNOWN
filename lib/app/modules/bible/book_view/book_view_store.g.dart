// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookViewStore on _BookViewStoreBase, Store {
  Computed<dynamic>? _$getFontSizeComputed;

  @override
  dynamic get getFontSize =>
      (_$getFontSizeComputed ??= Computed<dynamic>(() => super.getFontSize,
              name: '_BookViewStoreBase.getFontSize'))
          .value;

  final _$fontSizeAtom = Atom(name: '_BookViewStoreBase.fontSize');

  @override
  double get fontSize {
    _$fontSizeAtom.reportRead();
    return super.fontSize;
  }

  @override
  set fontSize(double value) {
    _$fontSizeAtom.reportWrite(value, super.fontSize, () {
      super.fontSize = value;
    });
  }

  final _$_BookViewStoreBaseActionController =
      ActionController(name: '_BookViewStoreBase');

  @override
  dynamic changeFont() {
    final _$actionInfo = _$_BookViewStoreBaseActionController.startAction(
        name: '_BookViewStoreBase.changeFont');
    try {
      return super.changeFont();
    } finally {
      _$_BookViewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePage(int index) {
    final _$actionInfo = _$_BookViewStoreBaseActionController.startAction(
        name: '_BookViewStoreBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_BookViewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fontSize: ${fontSize},
getFontSize: ${getFontSize}
    ''';
  }
}
