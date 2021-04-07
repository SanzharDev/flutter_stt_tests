///
//  Generated code. Do not modify.
//  source: stt-service.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use streamingRecognitionRequestDescriptor instead')
const StreamingRecognitionRequest$json = const {
  '1': 'StreamingRecognitionRequest',
  '2': const [
    const {'1': 'audio_content', '3': 1, '4': 1, '5': 12, '10': 'audioContent'},
    const {'1': 'get_result', '3': 2, '4': 1, '5': 8, '10': 'getResult'},
  ],
};

/// Descriptor for `StreamingRecognitionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamingRecognitionRequestDescriptor = $convert.base64Decode('ChtTdHJlYW1pbmdSZWNvZ25pdGlvblJlcXVlc3QSIwoNYXVkaW9fY29udGVudBgBIAEoDFIMYXVkaW9Db250ZW50Eh0KCmdldF9yZXN1bHQYAiABKAhSCWdldFJlc3VsdA==');
@$core.Deprecated('Use speechRecognitionResponseChunkDescriptor instead')
const SpeechRecognitionResponseChunk$json = const {
  '1': 'SpeechRecognitionResponseChunk',
  '2': const [
    const {'1': 'alternatives', '3': 1, '4': 1, '5': 11, '6': '.galamat.api.stt.v1.SpeechRecognitionAlternative', '10': 'alternatives'},
    const {'1': 'final', '3': 2, '4': 1, '5': 8, '10': 'final'},
    const {'1': 'end_of_utterance', '3': 3, '4': 1, '5': 8, '10': 'endOfUtterance'},
  ],
};

/// Descriptor for `SpeechRecognitionResponseChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechRecognitionResponseChunkDescriptor = $convert.base64Decode('Ch5TcGVlY2hSZWNvZ25pdGlvblJlc3BvbnNlQ2h1bmsSVAoMYWx0ZXJuYXRpdmVzGAEgASgLMjAuZ2FsYW1hdC5hcGkuc3R0LnYxLlNwZWVjaFJlY29nbml0aW9uQWx0ZXJuYXRpdmVSDGFsdGVybmF0aXZlcxIUCgVmaW5hbBgCIAEoCFIFZmluYWwSKAoQZW5kX29mX3V0dGVyYW5jZRgDIAEoCFIOZW5kT2ZVdHRlcmFuY2U=');
@$core.Deprecated('Use speechRecognitionAlternativeDescriptor instead')
const SpeechRecognitionAlternative$json = const {
  '1': 'SpeechRecognitionAlternative',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'confidence', '3': 2, '4': 1, '5': 2, '10': 'confidence'},
  ],
};

/// Descriptor for `SpeechRecognitionAlternative`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechRecognitionAlternativeDescriptor = $convert.base64Decode('ChxTcGVlY2hSZWNvZ25pdGlvbkFsdGVybmF0aXZlEhIKBHRleHQYASABKAlSBHRleHQSHgoKY29uZmlkZW5jZRgCIAEoAlIKY29uZmlkZW5jZQ==');
