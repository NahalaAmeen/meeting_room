class FoodModel {
  var id;
  var name;
  var imageUrl;
  var itemStatus;
  var catogary;

  FoodModel(
      {this.id, this.name, this.imageUrl, this.itemStatus, this.catogary});

  Map<String, dynamic> toMap() {
    return {
      'ID': this.id,
      'NAME': this.name,
      'IMAGEURL': this.imageUrl,
      'ITEMSTATUS': this.itemStatus,
      'CATOGARY': this.catogary
    };
  }
}

class CartModel
{
  var id;
  var chair_id;
  var chair_number;
  var image;
  var product_desc;
  var product_name;
  var product_qty;

  CartModel({
    this.id, 
    this.chair_id, 
    this.chair_number, 
    this.image,
    this.product_desc,
    this.product_name,
    this.product_qty
  });

  Map<String, dynamic> toCartMap() {
    return {
      'ID': this.id,
      'CHAIR_ID': this.chair_id,
      'CHAIR_NUMBER': this.chair_number,
      'IMAGE': this.image,
      'DESCRIPTION': this.product_desc,
      'NAME':this.product_name,
      'QUANTITY':this.product_qty
    };
  }
  
}
