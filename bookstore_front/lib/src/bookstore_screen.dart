import 'package:bookstore_front/src/components/appbar/presenter/appbar_core.dart';
import 'package:flutter/material.dart';

class BookstoreScreen extends StatefulWidget {
  const BookstoreScreen({super.key});

  @override
  State<BookstoreScreen> createState() => _BookstoreScreenState();
}

class _BookstoreScreenState extends State<BookstoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [const AppbarCore()]));
  }
}
