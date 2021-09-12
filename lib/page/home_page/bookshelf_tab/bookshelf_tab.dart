import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/book.dart';
import 'bookshelf_view_controller.dart';

class BookShelfTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final state = watch(bookshelfViewController.state);
    return Container(
      alignment: Alignment.center,
      child: state.when(loading: _buildLoading, loaded: _buildBookShelf),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildBookShelf(List<Book> books) {
    return GridView.extent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 0.65,
        children: books
            .map((book) => GridItem(
                  book: book,
                ))
            .toList());
  }
}

class GridItem extends StatelessWidget {
  const GridItem({Key? key, required this.book}) : super(key: key);
  final book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read(bookshelfViewController)
          .open(context: context, book: book),
      child: Card(
        margin: EdgeInsets.all(4),
        // color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage('assets/books/cover/${book.id}.png'),
                fit: BoxFit.fill,
              ),
              Container(
                height: 5,
              ),
              Expanded(child: Text('${book.name}'))
            ],
          ),
        ),
      ),
    );
  }
}
