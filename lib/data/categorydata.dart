import 'package:mini_ui_project/screens/categories_item/chinese_food.dart';
import 'package:mini_ui_project/screens/categories_item/fast_food.dart';
import 'package:mini_ui_project/screens/categories_item/fishes.dart';
import 'package:mini_ui_project/screens/categories_item/fruits.dart';
import 'package:mini_ui_project/screens/categories_item/singapore_food.dart';
import 'package:mini_ui_project/screens/categories_item/vegetables.dart';

List<Map> category = [
  {
    "image":
        "https://images.immediate.co.uk/production/volatile/sites/30/2023/02/Bowl-of-fruit-5155e6f.jpg?quality=90&resize=440,400",
    "name": "Fruits",
    "type": "Fresh",
    "subtype": Fruits(),
  },
  {
    "image": "https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg",
    "name": "vegetables",
    "type": "Fresh",
    "subtype": Vegetables()
  },
  {
    "image": "https://i.insider.com/60465b1b2db4af00117e41a8?width=700",
    "name": "Fish",
    "type": "From the sea",
    "subtype": Fishes()
  },
  {
    "image":
        "https://www.mashed.com/img/gallery/the-best-new-fast-food-menu-items-weve-tried-in-2023-so-far/l-intro-1682446897.jpg",
    "name": "Fast Food",
    "type": "Halka thori he",
    "subtype": FastFood()
  },
  {
    "image":
        "https://www.thespruceeats.com/thmb/g62dOJ7BgmKclKWtBLk_pX9Tr-s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/chinese-take-out-473784604-57d31f7f3df78c5833464853.jpg",
    "name": "Chinese Food",
    "type": "Dekh kar khana Kuch bhi hosakta he",
    "subtype": ChineseFood()
  },
  {
    "image":
        "https://images.lifestyleasia.com/wp-content/uploads/sites/6/2020/02/03154109/hawker-food-hero-image-image-credit-visit-singapore-1600x900.jpg",
    "name": "Singapore Food",
    "type": "Dekh kar khana Kuch bhi hosakta he",
    "subtype": SingaporeFood()
  },
];
