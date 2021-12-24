import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybible/app/core/models/book_model/book_model.dart';
import 'package:mybible/app/core/widgets/buttons.dart';
import 'package:mybible/app/modules/bible/book_selector/book_selector_store.dart';

import '../bible_version_enum.dart';

class BookSelectorWidget extends StatefulWidget {
  const BookSelectorWidget({Key? key}) : super(key: key);

  @override
  _BookSelectorWidgetState createState() => _BookSelectorWidgetState();
}

class _BookSelectorWidgetState
    extends ModularState<BookSelectorWidget, BookSelectorStore> {
  _showModalBooks() {
    return showModalBottomSheet(
      backgroundColor: Color(0xFFFFFBEF),
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: Observer(builder: (_) {
            if (controller.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        "Livros",
                        style: GoogleFonts.rufina(
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Divider(),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      BookModel book = controller.bibleStore.version[index];

                      return ExpansionTile(
                        title: Text(
                          "${book.name}",
                          style: GoogleFonts.rufina(
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        initiallyExpanded: (controller.bibleStore
                                                        .indexCurrentBook ==
                                                    index) ? true : false,
                        tilePadding: EdgeInsets.symmetric(horizontal: 16.0),
                        children: <Widget>[
                          GridView.count(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              padding: const EdgeInsets.all(20.0),
                              crossAxisSpacing: 10.0,
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height / 2),
                              crossAxisCount: 4,
                              children:
                                  List.generate(book.chapters!.length, (x) {
                                return Container(
                                  margin: EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.changeBookChapter(index, x);
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        textStyle:
                                            const TextStyle(fontSize: 20),
                                        primary: (controller.bibleStore
                                                        .indexCurrentBook ==
                                                    index &&
                                                controller.bibleStore
                                                        .currentChapter ==
                                                    x)
                                            ? Color(0xFF414D37)
                                            : Colors.grey,
                                        elevation: 0,
                                        shadowColor: Colors.transparent),
                                    child: Text(
                                      '${x + 1}',
                                      style: GoogleFonts.rufina(
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                );
                              }))
                        ],
                      );
                    },
                    itemCount: controller.bibleStore.version.length,
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }

  _showModalVersions() {
    return showModalBottomSheet(
      backgroundColor: Color(0xFFFFFBEF),
      context: context,
      isScrollControlled: false,
      isDismissible: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          // heightFactor: 0.85,
          child: Observer(builder: (_) {
            if (controller.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        "Versões",
                        style: GoogleFonts.rufina(
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Divider(),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (_, i) {
                    return ListTile(
                      trailing: controller.bibleStore.versionBible == BibleVersion.values[i] ? Icon(Icons.check) : null,
                      title: Text(
                        "${controller.bibleStore.getBibleVersions(i)}",
                        style: GoogleFonts.rufina(
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      
                      onTap: () {
                        controller.changeVersion(BibleVersion.values[i]);
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    );
                  },
                  itemCount: 3,
                ))
              ],
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        padding: EdgeInsets.all(8.0),
        width: 300,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonRounded("${controller.bibleStore.getCurrentBook}",
                isRoudedLeft: true, callback: _showModalBooks),
            SizedBox(
              width: 2,
            ),
            buttonRounded(("${controller.bibleStore.getCurrentVersion}"),
                isRoudedRight: true, callback: _showModalVersions),
          ],
        ),
      );
    });
  }
}
