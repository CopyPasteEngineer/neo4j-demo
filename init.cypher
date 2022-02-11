MATCH ()-[r]->(), (n)
DELETE r, n;

CREATE
  (user0:User {name: "Copy Paste", address: "MyHome Bangkok 10120"}),
  (user1:User {name: "Trainee Engineer", address: "YourHome Bangkok 10400"}),

  (all    :Category {name: "ทั้งหมด"      }),
  (cloth  :Category {name: "เสื้อผ้า"      })-[:SUBCAT]->(all),
  (eq     :Category {name: "เครื่องใช้"    })-[:SUBCAT]->(all),
  (hat    :Category {name: "หมวก"       })-[:SUBCAT]->(cloth),
  (shirt  :Category {name: "เสื้อ"        })-[:SUBCAT]->(cloth),
  (pant   :Category {name: "กางเกง"     })-[:SUBCAT]->(cloth),
  (shoe   :Category {name: "รองเท้า"     })-[:SUBCAT]->(cloth),
  (tshirt :Category {name: "เสื้อยืด"      })-[:SUBCAT]->(shirt),
  (cap    :Category {name: "หมวกแก๊ป"    })-[:SUBCAT]->(hat),
  (helmet :Category {name: "หมวกกันน็อค"  })-[:SUBCAT]->(hat),
  (heel   :Category {name: "รองเท้าส้นสูง" })-[:SUBCAT]->(shoe),
  (cup    :Category {name: "แก้วน้ำ"      })-[:SUBCAT]->(eq),
  (cupPlas:Category {name: "แก้วน้ำพลาสติก"})-[:SUBCAT]->(cup),
  (beerMug:Category {name: "แก้วเบียร์"    })-[:SUBCAT]->(cup),

  (cloth0  :Product {name: "ชุดนอนลาย logo CopyPasteEngineer",      price: 699})-[:IS_CAT]->(cloth),
  (tshirt0 :Product {name: "เสื้อยืดลาย logo CopyPasteEngineer สีขาว", price: 299})-[:IS_CAT]->(tshirt),
  (tshirt1 :Product {name: "เสื้อยืดลาย logo CopyPasteEngineer สีดำ",  price: 299})-[:IS_CAT]->(tshirt),
  (tshirt2 :Product {name: "เสื้อยืดคำคมประจำเพจ",                    price: 399})-[:IS_CAT]->(tshirt),
  (cupPlas0:Product {name: "แก้วน้ำสกรีนลายโค้ด Python",               price: 349})-[:IS_CAT]->(cupPlas),
  (beerMug0:Product {name: "แก้วเบียร์ทรงทิวลิปลาย StackOverflow",      price: 899})-[:IS_CAT]->(beerMug),
  (beerMug1:Product {name: "แก้วเบียร์ทรงสูงลาย StackOverflow",        price: 899})-[:IS_CAT]->(beerMug),

  (user0)-[:MAKE_ORDER]->(order0:Order {date: datetime('2021-04-13T12:50:35.556')}),
  (order0)-[:CONTAINS {amount: 2}]->(tshirt0),
  (order0)-[:CONTAINS {amount: 1}]->(tshirt1),

  (user0)-[:MAKE_ORDER]->(order1:Order {date: datetime('2021-04-15T11:00:31.354')}),
  (order1)-[:CONTAINS {amount: 1}]->(beerMug0),
  (order1)-[:CONTAINS {amount: 1}]->(cloth0),

  (user1)-[:MAKE_ORDER]->(order2:Order {date: datetime('2021-04-16T15:02:34.314')}),
  (order2)-[:CONTAINS {amount: 2}]->(tshirt2),
  (order2)-[:CONTAINS {amount: 1}]->(beerMug1),
  (order2)-[:CONTAINS {amount: 1}]->(cloth0);
