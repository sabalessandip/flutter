// Autogenerated from Pigeon (v20.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class PigeonError: Error {
  let code: String
  let message: String?
  let details: Any?

  init(code: String, message: String?, details: Any?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct DogBreedResponse {
  var data: String

  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ __pigeon_list: [Any?]) -> DogBreedResponse? {
    let data = __pigeon_list[0] as! String

    return DogBreedResponse(
      data: data
    )
  }
  func toList() -> [Any?] {
    return [
      data
    ]
  }
}
private class serviceApiPigeonCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 129:
      return DogBreedResponse.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class serviceApiPigeonCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? DogBreedResponse {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class serviceApiPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return serviceApiPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return serviceApiPigeonCodecWriter(data: data)
  }
}

class serviceApiPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = serviceApiPigeonCodec(readerWriter: serviceApiPigeonCodecReaderWriter())
}


/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol ServiceApi {
  func fetchDogBreed(breedId: String, completion: @escaping (Result<DogBreedResponse, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class ServiceApiSetup {
  static var codec: FlutterStandardMessageCodec { serviceApiPigeonCodec.shared }
  /// Sets up an instance of `ServiceApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: ServiceApi?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let fetchDogBreedChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.my_flutter_module.ServiceApi.fetchDogBreed\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      fetchDogBreedChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let breedIdArg = args[0] as! String
        api.fetchDogBreed(breedId: breedIdArg) { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      fetchDogBreedChannel.setMessageHandler(nil)
    }
  }
}
