import 'package:collection/collection.dart';

enum SeniorHouses {
  Sun,
  Churchill,
  Peel,
  Shaftesbury,
  Gellhorn,
  Anderson,
  Wu,
  Keller,
}

enum PrepHouses {
  Banks,
  Darwin,
  Shackleton,
  Parks,
  Nightingale,
  Fry,
  Lion,
}

enum PrefectGiving {
  Spot,
  Merit,
}

enum GcBanner {
  TheMassBanner,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (SeniorHouses):
      return SeniorHouses.values.deserialize(value) as T?;
    case (PrepHouses):
      return PrepHouses.values.deserialize(value) as T?;
    case (PrefectGiving):
      return PrefectGiving.values.deserialize(value) as T?;
    case (GcBanner):
      return GcBanner.values.deserialize(value) as T?;
    default:
      return null;
  }
}
