import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_bloc.dart';

class SearchPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController queryInputController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final searchBloc = Provider.of<SearchBloc>(context);
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: '検索キーワード',
                              ),
                              controller: queryInputController,
                            ))),
                    RaisedButton(
                        child: const Text('検索'),
                        onPressed: () =>
                            searchBloc.changeQuery.add(queryInputController.text)),
                  ])),
              StreamBuilder(
                  stream: searchBloc.result,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      // snapshot.error を使ったWidgetを返す
                      // snapshot は AsyncSnapshot<T> で
                    }
                    if (snapshot.data != null) {
                    // snapshot.data を使ったWidgetを返す
                    } else {
                    // 何かWidgetを返す
                    }
                    return Container();
                  })
            ])));
  }
}