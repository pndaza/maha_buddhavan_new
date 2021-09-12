import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maha_buddhavan/widget/pdf_controller.dart';

import '../../model/toc.dart';

final pdfControllerProvider =
    ScopedProvider<PdfController>((ref) => throw UnimplementedError());

class TocDialog extends StatelessWidget {
  final List<Toc> tocs;
  final PdfController pdfController;

  const TocDialog({Key? key, required this.tocs, required this.pdfController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [pdfControllerProvider.overrideWithValue(pdfController)],
      child: Material(
        child: SafeArea(
          child: Column(
            children: [
              Header(),
              Divider(),
              _buildTocList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTocList() {
    return Expanded(
      child: ListView.separated(
        itemCount: tocs.length,
        itemBuilder: (context, index) {
          return TocListTile(toc: tocs[index]);
        },
        separatorBuilder: (_, __) => Divider(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Text(
          'မာတိကာ',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        )),
        Container(
          alignment: Alignment.centerRight,
          child: IconButton(
              icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
        ),
      ],
    );
  }
}

class TocListTile extends StatelessWidget {
  final Toc toc;

  const TocListTile({Key? key, required this.toc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read(pdfControllerProvider).gotoPage(toc.pageNumber);
        Navigator.pop(context);
      },
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: toc.tocLevel == 1 ? TocLevelOne(title: toc.title) :
          TocLevelTwo(title: toc.title,)
          ),
    );
  }
}

class TocLevelOne extends StatelessWidget {
  const TocLevelOne({Key? key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}

class TocLevelTwo extends StatelessWidget {
  const TocLevelTwo({Key? key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20),
      ),
    );
  }
}
