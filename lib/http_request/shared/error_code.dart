class ErrorCode {
  static const String ERROR_CODE_UNKNOWN = "001";
  static const String ERROR_CODE_BAD_REQUEST = "002";
  static const String ERROR_CODE_TIME_OUT = "003";
  static const String ERROR_CODE_INTERNAL_ERROR = "004";
  static const String ERROR_CODE_REQUEST_NOT_FOUND = "005";
  static const String ERROR_CODE_BAD_METHOD = "006";

  //WMS
  static const String OFFLOAD_SEAL_NOT_MATCH = "44001";
  static const String OFFLOAD_CONTAINER_NOT_MATCH = "44002";
  static const String LP_SETUP_RECEIVED_QTY_NOT_MATCH_WITH_RN = "44003";
  static const String INVALID_LP_ID = "44004";
  static const String LP_SETUP_NOT_A_BLANK_LP = "44005";
  static const String LP_SETUP_LP_ALREADY_ASSOCIATED_WITH_CURRENT_TASK = "44006";
  static const String LP_SETUP_LP_TYPE_REQUIRED = "44007";
  static const String LP_SETUP_ITEMLINE_REQUIRED = "44008";
  static const String LP_SETUP_UNIT_REQUIRED = "44009";
  static const String LP_SETUP_INVALID_QTY = "44010";
  static const String LP_SETUP_PHOTO_REQUIRED_FOR_DAMAGE_GOOD = "44011";
  static const String LP_SETUP_LP_ID_REQUIRED = "44012";
  static const String LP_SETUP_INVALID_UNIT = "44013";
  static const String PICK_ITEM_NOT_COMPLETED = "44014";
  static const String SN_SCAN_EXPECTED_SNLIST = "44015";
  static const String SN_SCAN_QTY_NOT_MATCH = "44016";
  static const String PUT_AWAY_TASK_NOT_COMPLETE = "44017";
  static const String PICK_TASK_NOT_COMPLETE = "44018";
  static const String LP_CONFIGURATION_NOT_MATCH_WITH_ORDER_ITEMLINE = "40401";
  static const String SN_NOT_EXIST_IN_ITEMLINE_EXPECT = "44015";
  static const String LOCATION_ITEM_CHECK_NOT_MATCH = "44022";
  static const String TASK_ALLOW_FORCE_CLOSE = "44024";
  static const String LP_SETUP_QTY_EQUAL_ZERO = "44025";
  static const String DOUBLE_SUBMISSION = "49001";
  static const String PICK_TO_LP_NOT_FOUND = "NOT_FOUND";
  static const String RECEIVING_PLATE_REPRINT_WITHOUT_RN = "44030";
  static const String PICK_LP_ALREADY_BIND_ORDER = "44031";
  static const String NEED_COLLECT_SN_BEFORE_LOAD = "48002";
  static const String CYCLE_COUNT_ALL_LOCATION_COUNTED = "44032";
  static const String FOUND_PENDING_LPS = "44034";
  static const String LOCATION_ASSIGNED_TO_FIXED_ITEM = "44033";
  static const String LP_SETUP_NEED_FORCE_CLOSE = "44034";

  static const String NOT_ALLOW_SHORT_RECEIVE = "NOT_ALLOW_SHORT_RECEIVE";
  static const String NOT_PERMISSION_FORCE_CLOSE = "NOT_PERMISSION_FORCE_CLOSE";
  static const String FORCE_CLOSE_STEP = "FORCE_CLOSE_STEP";
  static const String COLLECT_VERIFICATION = "COLLECT_VERIFICATION";
  static const String OVER_RECEIVE = "50001";

  // IDM
  static const String USER_LOCKED = "46001";
  static const String USER_DISABLED = "46002";
  static const String PASSWORD_INVALID = "46003";
  static const String USER_ALREADY_LOGGED_IN_ANOTHER_DEVICE = "46004";
  static const String USER_INVALID = "46005";
}