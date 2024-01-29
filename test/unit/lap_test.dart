import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch/models/lap.dart';
import 'package:stopwatch/state/lap_engine.dart';

void main() {
  group('Lap Functionality Tests', () {
    //
    test(
      'Add Lap',
      () async {
        final LapEngine lapEngine = LapEngine(cachedLaps: []);
        final Lap newLap = Lap(elapsedTime: const Duration(seconds: 30));
        lapEngine.addLap(newLap);

        expect(
          lapEngine.savedLaps,
          equals([newLap]),
        );
      },
    );

    //
    test(
      'Remove Lap',
      () async {
        final LapEngine lapEngine = LapEngine(cachedLaps: []);
        final Lap newLap = Lap(elapsedTime: const Duration(seconds: 30));
        final Lap newLapTwo = Lap(elapsedTime: const Duration(seconds: 40));
        final Lap newLapThree = Lap(elapsedTime: const Duration(seconds: 10));
        lapEngine.addLap(newLap);
        lapEngine.addLap(newLapTwo);
        lapEngine.addLap(newLapThree);

        lapEngine.removeLap(newLapTwo.id);

        expect(
          lapEngine.savedLaps,
          equals([newLap, newLapThree]),
        );
      },
    );

    //
    test(
      'Remove All Laps',
      () async {
        final LapEngine lapEngine = LapEngine(cachedLaps: []);
        final Lap newLap = Lap(elapsedTime: const Duration(seconds: 30));
        final Lap newLapTwo = Lap(elapsedTime: const Duration(seconds: 40));
        final Lap newLapThree = Lap(elapsedTime: const Duration(seconds: 10));
        lapEngine.addLap(newLap);
        lapEngine.addLap(newLapTwo);
        lapEngine.addLap(newLapThree);

        lapEngine.clearLaps();

        expect(
          lapEngine.savedLaps,
          equals([]),
        );
      },
    );

    //
    test(
      'Check Lap Order',
      () async {
        final LapEngine lapEngine = LapEngine(cachedLaps: []);
        final Lap newLap = Lap(elapsedTime: const Duration(seconds: 30));
        final Lap newLapTwo = Lap(elapsedTime: const Duration(seconds: 40));
        final Lap newLapThree = Lap(elapsedTime: const Duration(seconds: 10));
        lapEngine.addLap(newLap);
        lapEngine.addLap(newLapTwo);
        lapEngine.addLap(newLapThree);

        expect(
          lapEngine.savedLaps[0].elapsedTime,
          equals(newLap.elapsedTime),
        );

        expect(
          lapEngine.savedLaps[1].elapsedTime,
          equals(newLapTwo.elapsedTime),
        );

        expect(
          lapEngine.savedLaps[2].elapsedTime,
          equals(newLapThree.elapsedTime),
        );
      },
    );

    //
    test(
      'Check Lap Order after removal of lap',
      () async {
        final LapEngine lapEngine = LapEngine(cachedLaps: []);
        final Lap newLap = Lap(elapsedTime: const Duration(seconds: 30));
        final Lap newLapTwo = Lap(elapsedTime: const Duration(seconds: 40));
        final Lap newLapThree = Lap(elapsedTime: const Duration(seconds: 10));
        lapEngine.addLap(newLap);
        lapEngine.addLap(newLapTwo);
        lapEngine.addLap(newLapThree);

        lapEngine.removeLap(newLapTwo.id);

        expect(
          lapEngine.savedLaps[0].elapsedTime,
          equals(newLap.elapsedTime),
        );

        expect(
          lapEngine.savedLaps[1].elapsedTime,
          equals(newLapThree.elapsedTime),
        );
      },
    );
  });
}
