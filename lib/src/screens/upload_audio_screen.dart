import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/components/loader/loading.dart';
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
                ElevatedButton(
                  onPressed: () {
                    uploadProvider.pickFile();
                  },
                  child: Icon(Icons.file_upload),
                ),
                Expanded(
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
