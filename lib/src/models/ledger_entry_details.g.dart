// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_entry_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LedgerEntryDetails _$LedgerEntryDetailsFromJson(Map<String, dynamic> json) =>
    LedgerEntryDetails(
      to: json['to'] as String?,
      from: json['from'] as String?,
      profileTransferId: json['profile_transfer_id'] as String?,
    );

Map<String, dynamic> _$LedgerEntryDetailsToJson(LedgerEntryDetails instance) =>
    <String, dynamic>{
      'to': instance.to,
      'from': instance.from,
      'profile_transfer_id': instance.profileTransferId,
    };
