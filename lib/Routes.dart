class Routes {
  static String BASE_URL = 'http://127.0.0.1:8000/api/';
  static String STORAGE_URL = 'http://127.0.0.1:8000/storage/';
  static String SEND_OTP = '${BASE_URL}send-otp';
  static String VERIFY_OTP(id) => '${BASE_URL}verify-otp/$id';
  static String USER_DETAILS = '${BASE_URL}user-details';
  //USER
  static String GET_USER_DATA(id) => '${BASE_URL}get-user-data/$id';
  //CATEGORY
  static String GET_CATEGORIES = '${BASE_URL}get-category';
  static String GET_ALL_CATEGORY = '${BASE_URL}get-all-category';
  //SUB CATEGORY
  static String GET_SUB_CATEGORY(id) => '${BASE_URL}get-sub-category/$id';
  //POST
  static String SUBMIT_ADS = '${BASE_URL}submit-ads';
  static String SUBMIT_VEHICLE_ADS = '${BASE_URL}submit-vehicle-ads';
  static String SUBMIT_PROPERTY_ADS = '${BASE_URL}submit-property-ads';

  //GET ADS
  static String GET_ADS_BY_CATEGORY = '${BASE_URL}get-ads-by-category';
}
