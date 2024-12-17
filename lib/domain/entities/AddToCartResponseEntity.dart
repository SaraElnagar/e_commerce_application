/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "67536ad0903ae68d4da6f55a"
/// data : {"_id":"67536ad0903ae68d4da6f55a","cartOwner":"6747e5b0803e888e0558bd82","products":[{"count":1,"_id":"67536ad0903ae68d4da6f55b","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-12-06T21:21:20.660Z","updatedAt":"2024-12-06T21:21:20.839Z","__v":0,"totalCartPrice":149}

class AddToCartResponseEntity {
  AddToCartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  AddDataCartEntity? data;
}

/// _id : "67536ad0903ae68d4da6f55a"
/// cartOwner : "6747e5b0803e888e0558bd82"
/// products : [{"count":1,"_id":"67536ad0903ae68d4da6f55b","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-12-06T21:21:20.660Z"
/// updatedAt : "2024-12-06T21:21:20.839Z"
/// __v : 0
/// totalCartPrice : 149

class AddDataCartEntity {
  AddDataCartEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<AddProductEntity>? products;
  num? v;
  num? totalCartPrice;
}

/// count : 1
/// _id : "67536ad0903ae68d4da6f55b"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class AddProductEntity {
  AddProductEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  num? count;
  String? id;
  String? product;
  num? price;
}
