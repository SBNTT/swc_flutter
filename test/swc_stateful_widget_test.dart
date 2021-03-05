import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:swc_flutter/swc_flutter.dart';
import 'common.dart';

void main() {
  group('Test SwcStatefulWidget', () {
    testWidgets('Wrapping a hardcoded Text Widget', (tester) async {
      final content = 'Hi!';
      await tester.pumpWidget(MaterialApp(
        home: _SimpleTestWidget(content: content),
      ));
      expect(find.text(content), findsOneWidget);
    });

    testWidgets('Counter widget', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: _CounterTestWidget(),
      ));

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Access to widget within SwcController', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: _CounterTestWidget(),
      ));

      final state = tester.state(find.byType(_CounterTestWidget));
      final controller = (state as SwcState).controller;
      
      expect(controller.widget, isNotNull);
      expect(controller.widget, isInstanceOf<_CounterTestWidget>());
    });
  });
}

class _SimpleTestWidget extends SwcStatefulWidget {

  final String? content;

  const _SimpleTestWidget({this.content});

  @override
  SwcState createState() => _SimpleTestWidgetState();

}

class _SimpleTestWidgetState extends SwcState<_SimpleTestWidget, EmptyController> {

  // ignore: annotate_overrides
  getController() => EmptyController();

  @override
  getProviders() => [];

  @override
  build(_) => Text(widget.content!);

}

class _CounterTestWidget extends SwcStatefulWidget {

  @override
  SwcState createState() => _CounterTestWidgetState();

}

class _CounterTestWidgetState extends SwcState<_CounterTestWidget, CounterController> {

  @override
  getController() => CounterController();

  @override
  getProviders() => [
    ChangeNotifierProvider<CounterState>(create: (_) => CounterState()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CounterState>(builder: (context, state, _) {
        return Text(state.get().toString());
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.onAddButtonClick(context),
        child: const Icon(Icons.add),
      ),
    );
  }

}