///
//  Generated code. Do not modify.
//  source: stt-service.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StreamingRecognitionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamingRecognitionRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'galamat.api.stt.v1'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'audioContent', $pb.PbFieldType.OY)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getResult')
    ..hasRequiredFields = false
  ;

  StreamingRecognitionRequest._() : super();
  factory StreamingRecognitionRequest({
    $core.List<$core.int> audioContent,
    $core.bool getResult,
  }) {
    final _result = create();
    if (audioContent != null) {
      _result.audioContent = audioContent;
    }
    if (getResult != null) {
      _result.getResult = getResult;
    }
    return _result;
  }
  factory StreamingRecognitionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamingRecognitionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamingRecognitionRequest clone() => StreamingRecognitionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamingRecognitionRequest copyWith(void Function(StreamingRecognitionRequest) updates) => super.copyWith((message) => updates(message as StreamingRecognitionRequest)) as StreamingRecognitionRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamingRecognitionRequest create() => StreamingRecognitionRequest._();
  StreamingRecognitionRequest createEmptyInstance() => create();
  static $pb.PbList<StreamingRecognitionRequest> createRepeated() => $pb.PbList<StreamingRecognitionRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamingRecognitionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamingRecognitionRequest>(create);
  static StreamingRecognitionRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get audioContent => $_getN(0);
  @$pb.TagNumber(1)
  set audioContent($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAudioContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearAudioContent() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get getResult => $_getBF(1);
  @$pb.TagNumber(2)
  set getResult($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGetResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearGetResult() => clearField(2);
}

class SpeechRecognitionResponseChunk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SpeechRecognitionResponseChunk', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'galamat.api.stt.v1'), createEmptyInstance: create)
    ..aOM<SpeechRecognitionAlternative>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alternatives', subBuilder: SpeechRecognitionAlternative.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'final')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endOfUtterance')
    ..hasRequiredFields = false
  ;

  SpeechRecognitionResponseChunk._() : super();
  factory SpeechRecognitionResponseChunk({
    SpeechRecognitionAlternative alternatives,
    $core.bool final_2,
    $core.bool endOfUtterance,
  }) {
    final _result = create();
    if (alternatives != null) {
      _result.alternatives = alternatives;
    }
    if (final_2 != null) {
      _result.final_2 = final_2;
    }
    if (endOfUtterance != null) {
      _result.endOfUtterance = endOfUtterance;
    }
    return _result;
  }
  factory SpeechRecognitionResponseChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SpeechRecognitionResponseChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SpeechRecognitionResponseChunk clone() => SpeechRecognitionResponseChunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SpeechRecognitionResponseChunk copyWith(void Function(SpeechRecognitionResponseChunk) updates) => super.copyWith((message) => updates(message as SpeechRecognitionResponseChunk)) as SpeechRecognitionResponseChunk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeechRecognitionResponseChunk create() => SpeechRecognitionResponseChunk._();
  SpeechRecognitionResponseChunk createEmptyInstance() => create();
  static $pb.PbList<SpeechRecognitionResponseChunk> createRepeated() => $pb.PbList<SpeechRecognitionResponseChunk>();
  @$core.pragma('dart2js:noInline')
  static SpeechRecognitionResponseChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpeechRecognitionResponseChunk>(create);
  static SpeechRecognitionResponseChunk _defaultInstance;

  @$pb.TagNumber(1)
  SpeechRecognitionAlternative get alternatives => $_getN(0);
  @$pb.TagNumber(1)
  set alternatives(SpeechRecognitionAlternative v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAlternatives() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlternatives() => clearField(1);
  @$pb.TagNumber(1)
  SpeechRecognitionAlternative ensureAlternatives() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get final_2 => $_getBF(1);
  @$pb.TagNumber(2)
  set final_2($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFinal_2() => $_has(1);
  @$pb.TagNumber(2)
  void clearFinal_2() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get endOfUtterance => $_getBF(2);
  @$pb.TagNumber(3)
  set endOfUtterance($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndOfUtterance() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndOfUtterance() => clearField(3);
}

class SpeechRecognitionAlternative extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SpeechRecognitionAlternative', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'galamat.api.stt.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confidence', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  SpeechRecognitionAlternative._() : super();
  factory SpeechRecognitionAlternative({
    $core.String text,
    $core.double confidence,
  }) {
    final _result = create();
    if (text != null) {
      _result.text = text;
    }
    if (confidence != null) {
      _result.confidence = confidence;
    }
    return _result;
  }
  factory SpeechRecognitionAlternative.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SpeechRecognitionAlternative.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SpeechRecognitionAlternative clone() => SpeechRecognitionAlternative()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SpeechRecognitionAlternative copyWith(void Function(SpeechRecognitionAlternative) updates) => super.copyWith((message) => updates(message as SpeechRecognitionAlternative)) as SpeechRecognitionAlternative; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeechRecognitionAlternative create() => SpeechRecognitionAlternative._();
  SpeechRecognitionAlternative createEmptyInstance() => create();
  static $pb.PbList<SpeechRecognitionAlternative> createRepeated() => $pb.PbList<SpeechRecognitionAlternative>();
  @$core.pragma('dart2js:noInline')
  static SpeechRecognitionAlternative getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpeechRecognitionAlternative>(create);
  static SpeechRecognitionAlternative _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get confidence => $_getN(1);
  @$pb.TagNumber(2)
  set confidence($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasConfidence() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfidence() => clearField(2);
}

