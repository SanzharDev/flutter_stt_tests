class Record {
  final int id;
  final String path;
  final String title;
  final String text;
  final String creationDate;
  final int duration;

  Record({
    this.id,
    this.path,
    this.title,
    this.text,
    this.creationDate,
    this.duration,
  });

  Record titleUpdatedClone(String newTitle) {
    return Record(
      id: this.id,
      path: this.path,
      title: newTitle,
      text: this.text,
      creationDate: this.creationDate,
      duration: this.duration,
    );
  }

  static Record defaultObject() {
    DateTime now = DateTime.now();
    return Record(
      path: 'No path',
      title: 'Created at $now',
      text: 'Text for $now',
      creationDate: 'now',
      duration: 1,
    );
  }

  static Record copyUpdatedId(Record record, int id) {
    return Record(
      id: id,
      path: record.path,
      title: record.title,
      text: record.text,
      creationDate: record.creationDate,
      duration: record.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'path': path,
      'title': title,
      'text': text,
      'creation_date': creationDate,
      'duration': duration,
    };
  }

  @override
  String toString() {
    return 'Record {id: $id, path: $path, title: $title, '
        'text: $text, creation_date: $creationDate, duration: $duration}';
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) {
    return this.hashCode == other.hashCode;
  }
}
