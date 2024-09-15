// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ResponseData',
      json,
      ($checkedConvert) {
        final val = ResponseData(
          results: $checkedConvert(
              'results',
              (v) => (v as List<dynamic>)
                  .map((e) => User.fromJson(e as Map<String, dynamic>))
                  .toList()),
          info: $checkedConvert(
              'info', (v) => Info.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'results': instance.results,
      'info': instance.info,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Info',
      json,
      ($checkedConvert) {
        final val = Info(
          seed: $checkedConvert('seed', (v) => v as String),
          results: $checkedConvert('results', (v) => (v as num).toInt()),
          page: $checkedConvert('page', (v) => (v as num).toInt()),
          version: $checkedConvert('version', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'seed': instance.seed,
      'results': instance.results,
      'page': instance.page,
      'version': instance.version,
    };
