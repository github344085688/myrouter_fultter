class Facility {
  String id;
  String name;
  String accessUrl;
  String createdBy;
  String createdWhen;
  String updatedBy;
  String updatedWhen;
  String thirdPartySite;
  String lpLabelSize;
  String lpPrefix;
  bool useLocationSequence;
  bool enableAutoGroupPickStragety;
  bool enableTaskAutoAssign;
  bool enableConveyorLine;
  bool requireScanCheckDigitForPickLocation;
  bool allowMultipleCustomersInOneLocation;
  bool usePickNewUI;
  bool submitPICountWithPicture;
  bool notBlindPICount;
  int userInactiveMinutes;
  int userTaskCapacity;
  int minTotalCaseByDn;
  List<String> exceptionNotificationEmails;
  String labelSize;
  bool collectLocationWifiInfo;
  bool forbidMovementViaPutAway;

  Facility(
      {this.id,
      this.name,
      this.accessUrl,
      this.createdBy,
      this.createdWhen,
      this.updatedBy,
      this.updatedWhen,
      this.thirdPartySite,
      this.lpLabelSize,
      this.lpPrefix,
      this.useLocationSequence,
      this.enableAutoGroupPickStragety,
      this.enableTaskAutoAssign,
      this.enableConveyorLine,
      this.requireScanCheckDigitForPickLocation,
      this.allowMultipleCustomersInOneLocation,
      this.usePickNewUI,
      this.submitPICountWithPicture,
      this.notBlindPICount,
      this.userInactiveMinutes,
      this.userTaskCapacity,
      this.minTotalCaseByDn,
      this.exceptionNotificationEmails,
      this.labelSize,
      this.collectLocationWifiInfo,
      this.forbidMovementViaPutAway});

  Facility.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.accessUrl = json['accessUrl'];
    this.createdBy = json['createdBy'];
    this.createdWhen = json['createdWhen'];
    this.updatedBy = json['updatedBy'];
    this.updatedWhen = json['updatedWhen'];
    this.thirdPartySite = json['thirdPartySite'];
    this.lpLabelSize = json['lpLabelSize'];
    this.lpPrefix = json['lpPrefix'];
    this.useLocationSequence = json['useLocationSequence'];
    this.enableAutoGroupPickStragety = json['enableAutoGroupPickStragety'];
    this.enableTaskAutoAssign = json['enableTaskAutoAssign'];
    this.enableConveyorLine = json['enableConveyorLine'];
    this.requireScanCheckDigitForPickLocation = json['requireScanCheckDigitForPickLocation'];
    this.allowMultipleCustomersInOneLocation = json['allowMultipleCustomersInOneLocation'];
    this.usePickNewUI = json['usePickNewUI'];
    this.submitPICountWithPicture = json['submitPICountWithPicture'];
    this.notBlindPICount = json['notBlindPICount'];
    this.userInactiveMinutes = json['userInactiveMinutes'];
    this.userTaskCapacity = json['userTaskCapacity'];
    this.minTotalCaseByDn = json['minTotalCaseByDn'];
    this.labelSize = json['lpLabelSize'];
    this.collectLocationWifiInfo = json['collectLocationWifiInfo'];
    this.forbidMovementViaPutAway = json['forbidMovementViaPutAway'];
    this.exceptionNotificationEmails = (json['exceptionNotificationEmails'] as List) != null ? (json['exceptionNotificationEmails'] as List).map((o) => o.toString()).toList() : null;;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['accessUrl'] = this.accessUrl;
    data['createdBy'] = this.createdBy;
    data['createdWhen'] = this.createdWhen;
    data['updatedBy'] = this.updatedBy;
    data['updatedWhen'] = this.updatedWhen;
    data['thirdPartySite'] = this.thirdPartySite;
    data['lpLabelSize'] = this.lpLabelSize;
    data['lpPrefix'] = this.lpPrefix;
    data['useLocationSequence'] = this.useLocationSequence;
    data['enableAutoGroupPickStragety'] = this.enableAutoGroupPickStragety;
    data['enableTaskAutoAssign'] = this.enableTaskAutoAssign;
    data['enableConveyorLine'] = this.enableConveyorLine;
    data['requireScanCheckDigitForPickLocation'] = this.requireScanCheckDigitForPickLocation;
    data['allowMultipleCustomersInOneLocation'] = this.allowMultipleCustomersInOneLocation;
    data['usePickNewUI'] = this.usePickNewUI;
    data['submitPICountWithPicture'] = this.submitPICountWithPicture;
    data['notBlindPICount'] = this.notBlindPICount;
    data['userInactiveMinutes'] = this.userInactiveMinutes;
    data['userTaskCapacity'] = this.userTaskCapacity;
    data['minTotalCaseByDn'] = this.minTotalCaseByDn;
    data['exceptionNotificationEmails'] = this.exceptionNotificationEmails;
    data['lpLabelSize'] = this.lpLabelSize;
    data['collectLocationWifiInfo'] = this.collectLocationWifiInfo;
    data['forbidMovementViaPutAway'] = this.forbidMovementViaPutAway;
    return data;
  }
}
