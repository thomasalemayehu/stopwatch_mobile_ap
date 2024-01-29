class Helper {
  static String formatDisplayTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String hours = twoDigits(duration.inHours);
    final String minutes = twoDigits(duration.inMinutes.remainder(60));
    final String seconds = twoDigits(duration.inSeconds.remainder(60));
    final String milliseconds =
        twoDigits(duration.inMilliseconds.remainder(1000) ~/ 10);

    return '$hours:$minutes:$seconds:$milliseconds';
  }
}
