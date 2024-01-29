import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:stopwatch/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end test', () {
    testWidgets('Stopwatch Display shows', (tester) async {
      await tester.pumpWidget(const StopwatchApp());
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('stopwatchDisplay')), findsOneWidget);

      expect(find.byKey(const Key('stopwatchControls')), findsOneWidget);

      expect(find.byKey(const Key('stopwatchControls')), findsOneWidget);

      expect(find.text("00:00:00:00"), findsOneWidget);

      await tester.pumpAndSettle();
      var startButton = find.text("Start");
      var stopButton = find.text("Stop");
      await tester.tap(startButton);
      await Future.delayed(const Duration(seconds: 1));
      expect(find.text("00:00:00:00"), findsNothing);
      await tester.tap(stopButton);

      await tester.pumpAndSettle();

      var lapButton = find.text("Lap");
      await tester.tap(startButton);
      await Future.delayed(const Duration(seconds: 1));
      await tester.tap(lapButton);
      await Future.delayed(const Duration(seconds: 1));
      await tester.tap(lapButton);

      await tester.tap(lapButton);
      await tester.pumpAndSettle();

      expect(find.text("Lap 1"), findsOne);
      expect(find.text("Lap 2"), findsOne);
      expect(find.text("Lap 3"), findsOne);
      expect(find.text("Lap 4"), findsNothing);
    });
  });
}
