import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "67536ad0903ae68d4da6f55a"
/// data : {"_id":"67536ad0903ae68d4da6f55a","cartOwner":"6747e5b0803e888e0558bd82","products":[{"count":2,"_id":"67536ad0903ae68d4da6f55b","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-12-06T21:21:20.660Z","updatedAt":"2024-12-06T21:26:41.020Z","__v":0,"totalCartPrice":298}

class AddToCartResponseDto extends AddToCartResponseEntity {
  AddToCartResponseDto({
    super.status,
    this.statusMsg,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddDataCartDto.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

/// _id : "67536ad0903ae68d4da6f55a"
/// cartOwner : "6747e5b0803e888e0558bd82"
/// products : [{"count":2,"_id":"67536ad0903ae68d4da6f55b","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-12-06T21:21:20.660Z"
/// updatedAt : "2024-12-06T21:26:41.020Z"
/// __v : 0
/// totalCartPrice : 298

class AddDataCartDto extends AddDataCartEntity {
  AddDataCartDto({
    super.id,
    super.cartOwner,
    super.products,
    this.createdAt,
    this.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddDataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDto.fromJson(v));
      });
    }
    v = json['__v'];
    v = json['__v'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? createdAt;
  String? updatedAt;
}

/// count : 2
/// _id : "67536ad0903ae68d4da6f55b"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class AddProductDto extends AddProductEntity {
  AddProductDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
