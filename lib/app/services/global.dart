class GlobalService {
  var lang = 'En';
  changeLang(lang) {
    this.lang = lang;
    // print(this.lang);
  }

  static String baseURL = 'https://auto.wecoders.app/api/';
  static String baseURLWithoutToken = 'https://autoserviceapi.herokuapp.com/';
}
