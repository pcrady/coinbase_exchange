import 'package:coinbase_exchange/src/lib/coinbase_enums.dart';
import 'package:logger/logger.dart';

import '../../coinbase_exchange.dart';
import '../clients/client.dart';
import '../models/fill.dart';
import '../models/order.dart';
import '../rest_clients/orders_rest_client.dart';
import 'dart:convert';

/// A [Client] that helps manage orders and returns coinbase_exchange
/// objects.
class OrdersClient extends Client {
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late OrdersRestClient _ordersRestClient;

  OrdersClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _ordersRestClient = OrdersRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  /// Get all fills
  ///
  /// Get a list of fills. A fill is a partial or complete match on a specific order.
  /// must contain either a productId or an orderId
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getfills
  ///
  Future<Paginator<Fill, int>> getAllFills({
    String? orderId,
    String? productId,
    String? profileId,
    int? limit,
    //TODO determine if int or datetime or dateformat or whatever
    int? before,
    int? after,
  }) async {
    var response = await _ordersRestClient.getAllFills(
      orderId: orderId,
      productId: productId,
      profileId: profileId,
      limit: limit,
      before: before,
      after: after,
    );

    if (response.statusCode != 200) throw response;

    return Paginator(
      before: response.headers.containsKey('cb-before')
          ? int.parse(response.headers['cb-before']!)
          : null,
      after: response.headers.containsKey('cb-after')
          ? int.parse(response.headers['cb-after']!)
          : null,
      elements:
          listDecode(response.body).map((fill) => Fill.fromJson(fill)).toList(),
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
  Future<Paginator<Order, DateTime>> getAllOrders({
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
    var response = await _ordersRestClient.getAllOrders(
      profileId: profileId,
      productId: productId,
      sortedBy: sortedBy,
      sorting: sorting,
      startDate: startDate,
      endDate: endDate,
      before: before,
      after: after,
      limit: limit,
      status: status,
    );

    if (response.statusCode != 200) throw response;

    return Paginator(
      before: response.headers.containsKey('cb-before')
          ? DateTime.parse(response.headers['cb-before']!)
          : null,
      after: response.headers.containsKey('cb-after')
          ? DateTime.parse(response.headers['cb-after']!)
          : null,
      elements: listDecode(response.body)
          .map((order) => Order.fromJson(order))
          .toList(),
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
  Future<List> cancelAllOrders({
    String? profileId,
    String? productId,
  }) async {
    var response = await _ordersRestClient.cancelAllOrders(
      profileId: productId,
      productId: productId,
    );

    if (response.statusCode != 200) throw response;

    return json.decode(response.body);
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
  Future<Order> createNewOrder({
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
    var response = await _ordersRestClient.createNewOrder(
      profileId: profileId,
      type: type,
      side: side,
      productId: productId,
      stp: stp,
      stop: stop,
      stopPrice: stopPrice,
      price: price,
      size: size,
      funds: funds,
      timeInForce: timeInForce,
      cancelAfter: cancelAfter,
      postOnly: postOnly,
      clientOid: clientOid,
    );

    if (response.statusCode != 200) throw response;

    return Order.fromJson(json.decode(response.body));
  }

  /// Get single order
  ///
  /// Get a single order by id.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getorder
  ///
  Future<Order> getSingleOrder({
    String? orderId,
  }) async {
    var response = await _ordersRestClient.getSingleOrder(
      orderId: orderId,
    );

    if (response.statusCode != 200) throw response;

    return Order.fromJson(json.decode(response.body));
  }

  /// Cancel an order
  ///
  /// Cancel a single open order by {id}.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_deleteorder
  ///
  Future<String> cancelOrder({
    required String orderId,
    String? profileId,
  }) async {
    var response = await _ordersRestClient.cancelOrder(
      profileId: profileId,
      orderId: orderId,
    );

    if (response.statusCode != 200) throw response;

    return json.decode(response.body);
  }
}
