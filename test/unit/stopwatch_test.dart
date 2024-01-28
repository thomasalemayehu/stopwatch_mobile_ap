import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Stopwatch Functionality Tests', () {
    //
    test(
      'Stopwatch Starts increments correctly',
      () async {
        final Stopwatch stopwatch = Stopwatch();
        stopwatch.start();
        await Future.delayed(const Duration(seconds: 1));
        expect(
          stopwatch.elapsed.inSeconds,
          equals(1),
        );
      },
    );

    test(
      'Stopwatch Continues After Stop and Start',
      () async {
        final Stopwatch stopwatch = Stopwatch();

        // count 1 second
        stopwatch.start();
        await Future.delayed(const Duration(seconds: 1));
        expect(
          stopwatch.elapsed.inSeconds,
          equals(1),
        );

        // stop for 1 second
        stopwatch.stop();
        await Future.delayed(const Duration(seconds: 1));
        expect(
          stopwatch.elapsed.inSeconds,
          equals(1),
        );

        // continue for 1 second
        stopwatch.start();
        await Future.delayed(const Duration(seconds: 1));
        expect(
          stopwatch.elapsed.inSeconds,
          equals(2),
        );
      },
    );
  });
}
