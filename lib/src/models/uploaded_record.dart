class UploadedRecord {
  final int id;
  final String audioId;
  final String status;
  final String title;
  final String text;
  final int duration;
  final String path;

  UploadedRecord({
    this.id,
    this.audioId,
    this.status,
    this.title,
    this.text,
    this.duration,
    this.path,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'audio_id': audioId,
      'status': status,
      'title': title,
      'text': text,
      'duration': duration,
      'path': path,
    };
  }

  @override
  String toString() {
    return 'UploadedRecord {id: $id, audioId: $audioId, status: $status, title: $title'
        'text: $text, duration: $duration, path: $path}';
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) {
    if (other != this) return false;
    if (!(other is UploadedRecord)) return false;
    UploadedRecord current = other;
    return this.hashCode == current.hashCode;
  }
}
