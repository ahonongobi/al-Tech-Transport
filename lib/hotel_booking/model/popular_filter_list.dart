class PopularFilterListData {
  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected;

  static List<PopularFilterListData> popularFList = <PopularFilterListData>[
    PopularFilterListData(
      titleTxt: 'Toyota',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Ranger',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Pool',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Pet Friendly',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Free deca',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'Tous',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Belle',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Voyage',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Mariage',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Occasion',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Resort',
      isSelected: false,
    ),
  ];
}
