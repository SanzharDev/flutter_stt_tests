import 'package:flutter/widgets.dart';
import 'package:stt_flutter/src/components/record/record_card.dart';
import 'package:stt_flutter/src/models/record.dart';

class HomeRecordsList extends StatefulWidget {
  final List<Record> _records;
  final Function _refreshList;
  HomeRecordsList({
    List<Record> records,
    Function refreshList,
  })  : _records = records,
        _refreshList = refreshList;
  @override
  _HomeRecordsListState createState() => _HomeRecordsListState();
}

class _HomeRecordsListState extends State<HomeRecordsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: widget._records != null ? widget._records.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return RecordCard(
              record: widget._records[index],
              refreshList: widget._refreshList,
            );
          }),
    );
  }
}
