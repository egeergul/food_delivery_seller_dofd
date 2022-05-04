import 'address_model.dart';

class Order {
  int? _totalSize;
  int? _typeId;
  int? _offset;

  late List<OrderModel>  _orders;
  List<OrderModel> get orders => _orders; // getter

  Order({required totalSize, required typeId, required offset, required  orders}){
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._orders = orders;
  }

  Order.fromJson(List <dynamic> json) {
    if (json != null) {
      _orders = <OrderModel>[];
      json.forEach((v) {
        _orders.add(new OrderModel.fromJson(v));
      });
    }
  }

}


class OrderModel {
  int? id;
  int? userId;
  int? orderAmount;
  String? paymentStatus;
  String? orderStatus;
  bool? confirmed;
  bool? accepted;
  int? scheduled;
  bool? processing;
  bool? handover;
  bool? failed;
  String? scheduledAt;
  String? deliveryAddressId;
  String? orderNote;
  String? createdAt;
  String? updatedAt;
  int? deliveryCharge;
  AddressModel? deliveryAddress;
  String? otp;//bu ne la
  String? pending;
  bool? pickedUp;
  bool? delivered;
  bool? canceled;

  OrderModel({
    this.id,
    required this.userId,
    required this.orderAmount,
    required this.deliveryAddress,
    this.paymentStatus,
    this.orderStatus,
    this.confirmed,
    this.accepted,
    this.scheduled,
    this.processing,
    this.handover,
    this.failed,
    this.scheduledAt,
    this.deliveryAddressId,
    this.orderNote,
    this.createdAt,
    this.updatedAt,
    this.deliveryCharge,
    this.otp,
    this.pending,
    this.pickedUp,
    this.delivered,
    this.canceled
  }){
    this.id = id;
    this.userId = userId;
    this.orderAmount = orderAmount;
    this.deliveryAddress = deliveryAddress;
    this.paymentStatus = paymentStatus;
    this.orderStatus = orderStatus;
    this.confirmed = confirmed;
    this.accepted = accepted;
    this.scheduled = scheduled;
    this.processing = processing;
    this.handover = handover;
    this.failed = failed;
    this.scheduledAt = scheduledAt;
    this.deliveryAddressId = deliveryAddressId;
    this.orderNote = orderNote;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.deliveryCharge = deliveryCharge;
    this.otp = otp;
    this.pending = pending;
    this.pickedUp = pickedUp;
    this.delivered = delivered;
    this.canceled = canceled;
  }

  OrderModel.fromJson(Map<String, dynamic> json) {
    //print("INSIDE FROM JSON");
    id = json['id'];
    userId = json['user_id']??"";
    orderAmount = json['order_amount']??"";
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    confirmed = json['confirmed'];
    accepted = json['accepted'];
    scheduled = json['scheduled'];
    processing = json['processing'];
    handover = json['handover'];
    failed = json['failed'];
    scheduledAt = json['scheduled_at'];
    deliveryAddressId = json['delivery_address_id']??"";
    orderNote = json['order_note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deliveryCharge = json['delivery_charge'];
    deliveryAddress = AddressModel.fromJson(json['delivery_address']);
    otp = json['otp'];
    pending = json['pending'];
    pickedUp = json['picked_up'];
    delivered = json['delivered'];
    canceled = json['canceled'];
  }

  //TODO
  Map<String, dynamic> toJson(){
    return {
      'id' : this.id,

    };
  }


}











