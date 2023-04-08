class ApiEndpoints {
  static String username = "krystianpetek2@gmail.com";
  static String passwd = "defaultPass";

  // static const awesomePlacesUrl = 'https://localhost:7098';
  static const registerUrl =
      'https://awesomeplacesapi20230325211214.azurewebsites.net/users/register';

  static const loginUrl =
      'https://awesomeplacesapi20230325211214.azurewebsites.net/users/login';

  static const awesomePlacesUrl =
      'https://awesomeplacesapi20230325211214.azurewebsites.net';

  static const String getPlaceCollection = '$awesomePlacesUrl/places';

  static getPlaceById(String id) => '$awesomePlacesUrl/places/$id';

  static const String postPlace = '$awesomePlacesUrl/places';

  static final Uri developerProfile =
      Uri.parse("https://github.com/krystianpetek/");

  static final Uri projectRepository =
      Uri.parse("https://github.com/krystianpetek/AwesomePlaces");

  static final Uri projectApiOAS = Uri.parse(
      "https://awesomeplacesapi20230325211214.azurewebsites.net/swagger/index.html");
}
