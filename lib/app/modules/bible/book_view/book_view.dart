import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybible/app/core/models/book_model/book_model.dart';
import 'package:mybible/app/core/models/book_model/chapter_model.dart';
import 'package:mybible/app/modules/bible/book_selector/book_selector.dart';
import 'package:mybible/app/modules/bible/book_view/book_view_store.dart';
import 'package:google_fonts/google_fonts.dart';

class BookViewPage extends StatefulWidget {
  const BookViewPage({Key? key}) : super(key: key);

  @override
  _BookViewPageState createState() => _BookViewPageState();
}

class _BookViewPageState extends ModularState<BookViewPage, BookViewStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: BookSelectorWidget(),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: controller.changeFont,
              icon: Icon(
                Icons.text_fields,
                color: Colors.black,
              ))
        ],
      ),
      body: Observer(builder: (_) {
        if (controller.bibleStore.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.bibleStore.currentBook != null) {
          ChapterModel chapters = controller.bibleStore.currentBook!
              .chapters![controller.bibleStore.currentChapter!];

          var colorSelect = Paint()
            ..color = Color(0xFFA49C7B).withOpacity(0.48);
          return PageView.builder(
              allowImplicitScrolling: false,
              pageSnapping: true,
              itemCount: controller.bibleStore.currentBook!.chapters!.length,
              controller: PageController(
                  viewportFraction: 1,
                  initialPage: controller.bibleStore.currentChapter!),
              onPageChanged: controller.changePage,
              itemBuilder: (_, i) {
                return ListView.builder(
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      title: Text(
                        "${i + 1} ${chapters.versicles![i].versicle}",
                        maxLines: 5,
                        style: GoogleFonts.rufina(
                            fontStyle: FontStyle.normal,
                            textStyle: TextStyle(
                                decorationColor:
                                    Color(0xFFA49C7B).withOpacity(0.48),
                                background: (chapters.versicles![i].isSelected)
                                    ? colorSelect
                                    : null,
                                color: chapters.versicles![i].isSelected
                                    ? Color(0xFF414D37)
                                    : Color(0xFF738369),
                                fontSize: controller.fontSize)),
                      ),
                      onTap: () {
                        chapters.versicles![i].selectVersicle();
                        setState(() {});
                      },
                    );
                  },
                  itemCount: chapters.versicles?.length,
                );
              });
        }
        return Container();
      }),
    );
  }
}
