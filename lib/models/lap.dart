class Lap {
  static int _idCounter = 0;
  int id;
  final Duration elapsedTime;

  static int _getNextId() {
    return _idCounter++; // Increment the counter and return the new value
  }

  Lap({required this.elapsedTime}) : id = _getNextId();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'elapsedTime': elapsedTime.inMilliseconds.toString(),
    };
  }

  factory Lap.fromJson(Map<String, dynamic> json) {
    return Lap(
      elapsedTime: Duration(milliseconds: int.parse(json['elapsedTime'])),
    ).._setId(json['id']);
  }
  void _setId(int newId) {
    _idCounter = newId > _idCounter ? newId : _idCounter;
    id = newId;
  }
}
