import 'package:pigeon/pigeon.dart';

// configuration: These options can also be specified on generate command
@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/service_api.dart',
  dartOptions: DartOptions(),
  swiftOut: 'lib/pigeons/serviceApi.swift',
  swiftOptions: SwiftOptions(),
))
// configuration

class DogBreedResponse {
  final String data;

  DogBreedResponse({required this.data});
}

@HostApi()
abstract class ServiceApi {
  @async
  DogBreedResponse fetchDogBreed(String breedId);
}
