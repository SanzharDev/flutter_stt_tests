import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stt_flutter/src/components/loader/loading.dart';
import 'package:stt_flutter/src/providers/upload_provider.dart';

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
                    uploadProvider.pickFile(context);
                  },
                  child: Icon(Icons.file_upload),
                ),
                ElevatedButton(
                  onPressed: () {
                    uploadProvider.getTranscribedText(context);
                  },
                  child: Icon(Icons.read_more),
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
