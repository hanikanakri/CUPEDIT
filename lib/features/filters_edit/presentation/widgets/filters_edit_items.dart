import '/core/constants/app_assets.dart';

class FiltersEditItems {
  final String? filtersEditName;
  final String? filtersEditAssets;

  static List<FiltersEditItems> filtersEditItemsList = [
    FiltersEditItems(filtersEditName: "filters", filtersEditAssets: AppAssets.filtersItem),
    FiltersEditItems(filtersEditName: "adjust", filtersEditAssets: AppAssets.adjustItem),
  ];

  FiltersEditItems({
    this.filtersEditAssets,
    this.filtersEditName,
  });
}
