enum ApiServices {
  delete(endpoint: '/delete'),
  //
  ;

  const ApiServices({required this.endpoint});

  final String endpoint;
}
