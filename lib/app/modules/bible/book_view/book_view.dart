import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybible/app/core/models/book_model/chapter_model.dart';
import 'package:mybible/app/core/widgets/loading.dart';
import 'package:mybible/app/modules/bible/book_selector/book_selector.dart';
import 'package:mybible/app/modules/bible/book_view/book_view_store.dart';
import 'package:google_fonts/google_fonts.dart';

class BookViewPage extends StatefulWidget {
  const BookViewPage({Key? key}) : super(key: key);

  @override
  _BookViewPageState createState() => _BookViewPageState();
}

class _BookViewPageState extends State<BookViewPage> {
  BookViewStore controller = Modular.get<BookViewStore>();

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
            child: Loading(),
          );
        }

        if (controller.bibleStore.currentBook != null) {
          ChapterModel chapters = controller.bibleStore.currentBook!
              .chapters![controller.bibleStore.currentChapter!];

          return ListView.builder(
            itemBuilder: (ctx, i) {
              return Observer(
                builder: (ctx) {
                  Paint colorSelect = Paint()
                    ..color = Color(0xFFA49C7B).withOpacity(0.48);

                  TextStyle versicleStyle = GoogleFonts.rufina(
                      fontStyle: FontStyle.normal,
                      textStyle: TextStyle(
                          decorationColor: Color(0xFFA49C7B).withOpacity(0.48),
                          background: (chapters.versicles![i].isSelected)
                              ? colorSelect
                              : null,
                          color: chapters.versicles![i].isSelected
                              ? Color(0xFF414D37)
                              : Color(0xFF738369),
                          fontSize: controller.getFontSize));

                  return ListTile(
                    horizontalTitleGap: 10,
                    minVerticalPadding: 0,
                    minLeadingWidth: 0,
                    leading: Text("${i + 1}",
                        style: versicleStyle.copyWith(
                            fontWeight: FontWeight.bold)),
                    title: Text(
                      "${chapters.versicles![i].versicle}",
                      maxLines: 5,
                      style: versicleStyle,
                    ),
                    onTap: () {
                      chapters.versicles![i].selectVersicle();
                      setState(() {});
                    },
                  );
                },
              );
            },
            itemCount: chapters.versicles?.length,
          );
        }
        return Container();
      }),
    );
  }
}
