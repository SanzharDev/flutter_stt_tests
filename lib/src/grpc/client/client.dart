import 'dart:developer';

import 'package:grpc/grpc.dart';
import 'package:stt_flutter/src/grpc/generated/stt-service.pbgrpc.dart';

class Client {
  sttServiceClient stub;
  ClientChannel channel;
  bool _isStubInitialized = false;
  ResponseStream<SpeechRecognitionResponseChunk> _result;

  void _init() {
    try {
      channel = ClientChannel('185.97.114.171',
          port: 8055,
          options:
              const ChannelOptions(credentials: ChannelCredentials.insecure()));
      stub = sttServiceClient(channel,
          options: CallOptions(timeout: Duration(seconds: 660)));
      _isStubInitialized = true;
      log('gRPC Stub initialized');
    } catch (e) {
      log('Can\'t establish gRPC connection. Exception: $e');
    }
  }

  Future<void> sendOngoingRequestChunk(final audioData) async {
    try {
      if (!_isStubInitialized) {
        _init();
      }
      _sendRequest(audioData, false);
    } catch (e) {
      log('Something went wrong during request chunk streaming');
    }
  }

  Future<SpeechRecognitionResponseChunk> sendFinalRequestChunk(
      final lastChunk) async {
    var result = SpeechRecognitionResponseChunk();
    try {
      result = await _sendRequest(lastChunk, true);
    } catch (e) {
      log(e.toString());
      log('Something went wrong when last request chunk were send');
      log('Result is assigned to a default SpeechRecognitionResponseChunk');
    } finally {
      try {
        await channel.shutdown();
        _isStubInitialized = false;
      } catch (e) {
        log('Error happened on channel shutdown');
        log(e);
      } finally {
        log('Channel closed');
      }
    }
    return result;
  }

  Future<SpeechRecognitionResponseChunk> _sendRequest(
      final audioData, final isLastChunk) async {
    var requestChunk = StreamingRecognitionRequest(
        audioContent: audioData, getResult: isLastChunk);
    Stream<StreamingRecognitionRequest> outgoingRequestStream() async* {
      yield requestChunk;
    }

    log('Request chunk collected');
    Stream<SpeechRecognitionResponseChunk> response =
        stub.streamRecognize(outgoingRequestStream());
    !isLastChunk
        ? log('Request sent to STT Server')
        : log('Final request chunk sent');
    SpeechRecognitionResponseChunk result = SpeechRecognitionResponseChunk();
    if (isLastChunk) {
      await for (var r in response) {
        result = r;
        log('Awaited response from STT Server: ${r.alternatives.text}');
      }
    }
    return Future.value(result);
  }

  Future<void> startStreaming(
      Stream<StreamingRecognitionRequest> stream) async {
    try {
      if (!_isStubInitialized) {
        _init();
      }
      _result = stub.streamRecognize(stream);
    } catch (e) {
      log('Something went wrong during streaming');
    }
  }

  Future<SpeechRecognitionResponseChunk> streamingResult() {
    return _result.last;
  }
}
