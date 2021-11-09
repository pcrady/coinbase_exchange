import 'package:coinbase_exchange/src/lib/coinbase_enums.dart';

import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage orders and returns http.Response
/// objects.
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

  /// Get all fills
  ///
  /// Get a list of fills. A fill is a partial or complete match on a specific order.
  /// must contain either a productId or an orderId
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getfills
  ///
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

  /// Get all orders
  ///
  /// List your current open orders. Only open or un-settled orders are
  /// returned by default. As soon as an order is no longer open and
  /// settled, it will no longer appear in the default request. Open
  /// orders may change state between the request and the response
  /// depending on market conditions.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getorders
  ///
  Future<http.Response> getAllOrders({
    String? profileId,
    String? productId,
    SortedByEnum? sortedBy,
    SortingEnum? sorting,
    DateTime? startDate,
    DateTime? endDate,
    String? before,
    String? after,
    required int limit,
    required List<StatusEnum> status,
  }) async {
    Map<String, dynamic> queryParameters = {
      'limit': limit,
      'status': status.map((e) => e.status()).toList(),
    };
    if (profileId != null) queryParameters['profile_id'] = profileId;
    if (productId != null) queryParameters['product_id'] = productId;
    if (sortedBy != null) queryParameters['sortedBy'] = sortedBy.sortType();
    if (sorting != null) queryParameters['sorting'] = sorting.sorting();
    if (startDate != null) queryParameters['start_date'] = startDate;
    if (endDate != null) queryParameters['end_date'] = endDate;
    if (before != null) queryParameters['before'] = before;
    if (after != null) queryParameters['after'] = after;

    return get(
      path: '/orders',
      queryParameters: queryParameters,
    );
  }

  /// Cancel all orders
  ///
  /// With best effort, cancel all open orders. This may
  /// require you to make the request multiple times until
  /// all of the open orders are deleted.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_deleteorders
  ///
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

  /// Create a new order
  ///
  /// Create an order. You can place two types of orders:
  /// limit and market. Orders can only be placed if your
  /// account has sufficient funds. Once an order is placed,
  /// your account funds will be put on hold for the duration
  /// of the order. How much and which funds are put on hold
  /// depends on the order type and parameters specified.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postorders
  ///
  Future<http.Response> createNewOrder({
    String? profileId,
    OrderEnum? type,
    required SideEnum side,
    required String productId,
    StpEnum? stp,
    StopEnum? stop,
    double? stopPrice,
    double? price,
    double? size,
    double? funds,
    TimeInForceEnum? timeInForce,
    CancelAfterEnum? cancelAfter,
    bool? postOnly,
    String? clientOid,
  }) async {
    Map<String, dynamic> body = {
      'side': side.side(),
      'product_id': productId,
    };
    if (profileId != null) body['profile_id'] = productId;
    if (type != null) body['type'] = type.orderType();
    if (stp != null) body['stp'] = stp.stp();
    if (stop != null) body['stop'] = stop.stop();
    if (stopPrice != null) body['stop_price'] = stopPrice;
    if (price != null) body['price'] = price;
    if (size != null) body['size'] = size;
    if (funds != null) body['funds'] = funds;
    if (timeInForce != null) body['time_in_force'] = timeInForce.timeInForce();
    if (cancelAfter != null) body['cancel_after'] = cancelAfter.cancelAfter();
    if (postOnly != null) body['post_only'] = postOnly;
    if (clientOid != null) body['client_oid'] = clientOid;

    return post(
      path: '/orders',
      body: body,
    );
  }

  /// Get single order
  ///
  /// Get a single order by id.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getorder
  ///
  Future<http.Response> getSingleOrder({
    String? orderId,
  }) async =>
      get(path: '/orders/$orderId');

  /// Cancel an order
  ///
  /// Cancel a single open order by {id}.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_deleteorder
  ///
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
