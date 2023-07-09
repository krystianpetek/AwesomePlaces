class ApiEndpoints {
  static String username = "krystianpetek2@gmail.com";
  static String passwd = "defaultPass";

  // static const awesomePlacesUrl = 'https://localhost:7098';
  static const awesomePlacesUrl =
      'https://awesomeplacesapi20230325211214.azurewebsites.net';

  static const registerUrl = '$awesomePlacesUrl/users/register';

  static const loginUrl = '$awesomePlacesUrl/users/login';

  static const String getPlaceCollection = '$awesomePlacesUrl/places';

  static getPlaceById(String id) => '$awesomePlacesUrl/places/$id';

  static const String postPlace = '$awesomePlacesUrl/places';

  static final Uri developerProfile =
      Uri.parse("https://github.com/krystianpetek/");

  static final Uri projectRepository =
      Uri.parse("https://github.com/krystianpetek/AwesomePlaces");

  static final Uri projectApiOAS =
      Uri.parse("$awesomePlacesUrl/swagger/index.html");
}
