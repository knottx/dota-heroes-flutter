import 'package:dio/dio.dart';
import 'package:dota_heroes/data/data_source/api_client_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_client_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late ApiClientImpl apiClient;

  setUp(() {
    mockDio = MockDio();
    apiClient = ApiClientImpl(mockDio);
  });

  group('ApiClientImpl', () {
    const tPath = '/test';
    final tResponse = Response(
      requestOptions: RequestOptions(path: tPath),
      statusCode: 200,
      data: {'key': 'value'},
    );

    test('should perform a GET request and return the response', () async {
      
      when(mockDio.get(tPath, queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => tResponse);

      
      final result = await apiClient.get(tPath);

      
      expect(result, tResponse);
      verify(mockDio.get(tPath, queryParameters: anyNamed('queryParameters')))
          .called(1);
    });

    test('should perform a POST request and return the response', () async {
      
      const tData = {'name': 'test'};
      when(mockDio.post(tPath, data: tData)).thenAnswer((_) async => tResponse);

      
      final result = await apiClient.post(tPath, data: tData);

      
      expect(result, tResponse);
      verify(mockDio.post(tPath, data: tData)).called(1);
    });

    test('should perform a PUT request and return the response', () async {
      
      const tData = {'name': 'test'};
      when(mockDio.put(tPath, data: tData)).thenAnswer((_) async => tResponse);

      
      final result = await apiClient.put(tPath, data: tData);

      
      expect(result, tResponse);
      verify(mockDio.put(tPath, data: tData)).called(1);
    });

    test('should perform a DELETE request and return the response', () async {
      
      const tData = {'name': 'test'};
      when(mockDio.delete(tPath, data: tData))
          .thenAnswer((_) async => tResponse);

      
      final result = await apiClient.delete(tPath, data: tData);

      
      expect(result, tResponse);
      verify(mockDio.delete(tPath, data: tData)).called(1);
    });
  });
}
