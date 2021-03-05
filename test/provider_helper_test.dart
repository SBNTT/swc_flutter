import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:swc_flutter/src/provider_helper.dart';

void main() {
  group('Test ProviderHelper', () {
    testWidgets('pGet should return content', (tester) async {
      final content = 'Hi!';
      await tester.pumpWidget(MaterialApp(
        home: _PGetTestWidget(content: content),
      ));
      expect(find.text(content), findsOneWidget);
    });

    testWidgets('pGet should return null', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: _InvalidPGetTestWidget(),
      ));
      expect(find.text('null'), findsOneWidget);
    });
  });
}

class _PGetTestWidget extends StatelessWidget with ProviderHelper {

  final String? content;

  _PGetTestWidget({this.content});

  @override
  Widget build(BuildContext context) {
    return Provider<String?>(
      create: (_) => content,
      child: Builder(builder: (context) {
        return Text(pGet<String?>(context).toString());
      }),
    );
  }

}

class _InvalidPGetTestWidget extends StatelessWidget with ProviderHelper {

  @override
  Widget build(BuildContext context) {
    return Text(pGet<String>(context).toString());
  }

}