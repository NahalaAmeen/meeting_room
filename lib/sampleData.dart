// types of Categorys  involved
//Tea & Snacks
//Coffee
//Snacks
//Combos
//Burgers
//Breakfast
//Dining
//Lunch
//Biriyani
//Veg
//Non-veg

class Data {
  var sampleData = {
    {
      'id': '4',
      'name': 'Masala Dosa',
      'imageUrl':
          'https://www.cookwithmanali.com/wp-content/uploads/2020/05/Masala-Dosa.jpg',
      'itemStatus': 'true',
      'Tags': ['Breakfast', 'Veg', 'Snacks'],
    },
    {
      'id': '1',
      'name': 'VegCuruma',
      'imageUrl':
          'https://i.pinimg.com/originals/9e/3f/c4/9e3fc4802cdf34f9a9fc1a267f342033.jpg',
      'itemStatus': 'true',
      'Tags': ['Veg', 'Dining', 'Breakfast'],
    },
    {
      'id': '2',
      'name': 'Tea',
      'imageUrl':
          'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/beveragedaily.com/article/2020/01/31/what-next-for-lipton-and-pg-tips-unilever-s-strategic-tea-review/10657232-5-eng-GB/What-next-for-Lipton-and-PG-Tips-Unilever-s-strategic-tea-review.jpg',
      'itemStatus': 'true',
      'Tags': ['Coffee', 'Tea & Snacks', 'Snacks'],
    },
    {
      'id': '3',
      'name': 'Coffee',
      'imageUrl':
          'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F9%2F2021%2F06%2F22%2Fdifferent-types-of-tea-FT-BLOG0621.jpg',
      'itemStatus': 'true',
      'Tags': ['Coffee', 'Tea & Snacks', 'Snacks'],
    },
    {
      'id': '4',
      'name': 'Masala Dosa',
      'imageUrl':
          'https://www.cookwithmanali.com/wp-content/uploads/2020/05/Masala-Dosa.jpg',
      'itemStatus': 'true',
      'Tags': ['Breakfast', 'Veg', 'Snacks'],
    },
    {
      'id': '1',
      'name': 'VegCuruma',
      'imageUrl':
          'https://i.pinimg.com/originals/9e/3f/c4/9e3fc4802cdf34f9a9fc1a267f342033.jpg',
      'itemStatus': 'true',
      'Tags': ['Veg', 'Dining', 'Breakfast'],
    },
    {
      'id': '2',
      'name': 'Tea',
      'imageUrl':
          'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/beveragedaily.com/article/2020/01/31/what-next-for-lipton-and-pg-tips-unilever-s-strategic-tea-review/10657232-5-eng-GB/What-next-for-Lipton-and-PG-Tips-Unilever-s-strategic-tea-review.jpg',
      'itemStatus': 'true',
      'Tags': ['Coffee', 'Tea & Snacks', 'Snacks'],
    },
    {
      'id': '3',
      'name': 'Coffee',
      'imageUrl':
          'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F9%2F2021%2F06%2F22%2Fdifferent-types-of-tea-FT-BLOG0621.jpg',
      'itemStatus': 'true',
      'Tags': ['Coffee', 'Tea & Snacks', 'Snacks'],
    },
  };

  static Set Tags = Set();
  static List<Map<String, dynamic>> sortedFoods = [];

  getDishes() {
    sampleData.forEach((element) {
      (element['Tags'] as List).forEach((element) {
        Tags.add(element);
      });
    });
    setSortedFood();
  }

  setSortedFood() {
    Tags.forEach((tag) {
      List foods = [];
      sampleData.forEach((food) {
        (food['Tags'] as List).forEach((foodTag) {
          if (foodTag == tag) {
            foods.add(food);
          }
        });
      });
      if (foods.length > 0) {
        sortedFoods.add({tag: foods});
      }
    });
  }
}
