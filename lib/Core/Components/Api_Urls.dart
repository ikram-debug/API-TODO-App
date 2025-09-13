


class ApiUrl {

  static var baseUrl = 'https://68900687944bf437b59494b0.mockapi.io/';

  static var getTodosEndpoint = baseUrl +'Todo';
  static var postTodosEndpoint = baseUrl +'Todo';

  static String putTodosEndpoint(String id) => baseUrl +'Todo/$id';
  static String deleteTodosEndpoint(String id) => baseUrl +'Todo/$id';

}
