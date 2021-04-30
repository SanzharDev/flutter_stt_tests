import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/components/loader/loading.dart';
import 'package:stt_flutter/src/components/uploads/uploads_list.dart';
import 'package:stt_flutter/src/providers/uploads_provider.dart';

class UploadAudioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UploadProvider>(
      builder: (context, uploadProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Upload audio'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 5,
                  child: UploadsList(),
                ),
                Expanded(
                  flex: 1,
                  child: RawMaterialButton(
                    onPressed: () {
                      uploadProvider.pickFile();
                    },
                    child: Icon(Icons.file_upload),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: uploadProvider.isLoading
                        ? LoadingComponent()
                        : Text('Select an audio')),
              ],
            ),
          ),
        );
      },
    );
  }
}
