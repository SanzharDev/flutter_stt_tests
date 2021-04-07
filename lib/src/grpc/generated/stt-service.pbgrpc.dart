///
//  Generated code. Do not modify.
//  source: stt-service.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'stt-service.pb.dart' as $0;
export 'stt-service.pb.dart';

class sttServiceClient extends $grpc.Client {
  static final _$streamRecognize = $grpc.ClientMethod<
          $0.StreamingRecognitionRequest, $0.SpeechRecognitionResponseChunk>(
      '/galamat.api.stt.v1.sttService/StreamRecognize',
      ($0.StreamingRecognitionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.SpeechRecognitionResponseChunk.fromBuffer(value));

  sttServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.SpeechRecognitionResponseChunk> streamRecognize(
      $async.Stream<$0.StreamingRecognitionRequest> request,
      {$grpc.CallOptions options}) {
    return $createStreamingCall(_$streamRecognize, request, options: options);
  }
}

abstract class sttServiceBase extends $grpc.Service {
  $core.String get $name => 'galamat.api.stt.v1.sttService';

  sttServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StreamingRecognitionRequest,
            $0.SpeechRecognitionResponseChunk>(
        'StreamRecognize',
        streamRecognize,
        true,
        true,
        ($core.List<$core.int> value) =>
            $0.StreamingRecognitionRequest.fromBuffer(value),
        ($0.SpeechRecognitionResponseChunk value) => value.writeToBuffer()));
  }

  $async.Stream<$0.SpeechRecognitionResponseChunk> streamRecognize(
      $grpc.ServiceCall call,
      $async.Stream<$0.StreamingRecognitionRequest> request);
}
