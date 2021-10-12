import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

class OrdersRestClient extends RestClient {
  OrdersRestClient({
    bool sandbox = false,
    required String apiKey,
    required String secretKey,
    required String passphrase,
  }) : super(
          sandbox: sandbox,
          apiKey: apiKey,
          secretKey: secretKey,
          passphrase: passphrase,
        );

  Future<http.Response> getAllFills({
    String? orderId,
    String? productId,
    String? profileId,
    int? limit,
    //TODO determine if int or datetime or dateformat or whatever
    int? before,
    int? after,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (orderId != null) queryParameters['order_id'] = orderId;
    if (productId != null) queryParameters['product_id'] = productId;
    if (profileId != null) queryParameters['profile_id'] = profileId;
    if (limit != null) queryParameters['limit'] = limit;
    if (before != null) queryParameters['before'] = before;
    if (after != null) queryParameters['after'] = after;

    return get(
      path: '/fills',
      queryParameters: queryParameters,
    );
  }

  Future<http.Response> getAllOrders({
    String? profileId,
    String? productId,
    //TODO make enum
    String? sortedBy,
    //TODO make enum
    String? sorting,
    DateTime? startDate,
    DateTime? endDate,
    String? before,
    String? after,
    required int limit,
    //TODO make enum
    required List<String> status,
  }) async {
    Map<String, dynamic> queryParameters = {
      'limit': limit,
      'status': status,
    };
    if (profileId != null) queryParameters['profile_id'] = profileId;
    if (productId != null) queryParameters['product_id'] = productId;
    if (sortedBy != null) queryParameters['sortedBy'] = sortedBy;
    if (sorting != null) queryParameters['sorting'] = sorting;
    if (startDate != null) queryParameters['start_date'] = startDate;
    if (endDate != null) queryParameters['end_date'] = endDate;
    if (before != null) queryParameters['before'] = before;
    if (after != null) queryParameters['after'] = after;

    return get(
      path: '/orders',
      queryParameters: queryParameters,
    );
  }

  Future<http.Response> cancelAllOrders({
    String? profileId,
    String? productId,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (profileId != null) queryParameters['profile_id'] = profileId;
    if (productId != null) queryParameters['product_id'] = productId;

    return delete(
      path: 'orders',
      queryParameters: queryParameters,
    );
  }

  Future<http.Response> createNewOrder({
    String? profileId,
    //TODO make enum
    String? type,
    //TODO make enum
    required String? side,
    required String? productId,
    //TODO make enum
    String? stp,
    //TODO make enum
    String? stop,
    double? stopPrice,
    double? price,
    double? size,
    double? funds,
    //TODO make enum
    String? timeInForce,
    //TODO make enum
    String? cancelAfter,
    bool? postOnly,
    String? clientOid,
  }) async {
    Map<String, dynamic> body = {
      'side': side,
      'product_id': productId,
    };
    if (profileId != null) body['profile_id'] = productId;
    if (type != null) body['type'] = type;
    if (stp != null) body['stp'] = stp;
    if (stop != null) body['stop'] = stop;
    if (stopPrice != null) body['stop_price'] = stopPrice;
    if (price != null) body['price'] = price;
    if (size != null) body['size'] = size;
    if (funds != null) body['funds'] = funds;
    if (timeInForce != null) body['time_in_force'] = timeInForce;
    if (cancelAfter != null) body['cancel_after'] = cancelAfter;
    if (postOnly != null) body['post_only'] = postOnly;
    if (clientOid != null) body['client_oid'] = clientOid;

    return post(
      path: '/orders',
      body: body,
    );
  }

  Future<http.Response> getSingleOrder({
    String? orderId,
  }) async =>
      get(path: '/orders/$orderId');

  Future<http.Response> cancelOrder({
    required String orderId,
    String? profileId,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (profileId != null) queryParameters['profile_id'] = profileId;

    return delete(
      path: '/orders/$orderId',
      queryParameters: queryParameters,
    );
  }
}
