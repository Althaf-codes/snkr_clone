import 'package:snkr_app/model/product_model.dart';
import 'package:snkr_app/model/size_guide_model.dart';
import 'package:snkr_app/model/sub_menu_model.dart';

class AppData {
  final List<String> _allBrands = [
    "Adidas",
    "Asics",
    "Carhartt WIP",
    "Carrots",
    "Chinatown Market",
    "Crocs",
    "Crep Protect",
    "Huf",
    "Jason Markks",
    "Jordan",
    "Les Benjamins",
    "Market",
    "Nike",
    "New Era",
    "New Balance",
    "On Running",
    "Ortho Movement",
    "Patagonia",
    "Puma",
    "Salomon",
    "Saucony",
    "Stussy",
    "Stanley",
    "Veja",
  ];
  final Map<String, List<SubMenuModel>> _allDepartments = {
    "Footwear": [
      SubMenuModel(title: "Show all Footwear", id: 1, items: [
        Item(title: 'Adidas', id: 0),
        Item(title: 'Asics', id: 1),
        Item(title: 'Carhartt WIP', id: 2),
        Item(title: 'Carrots', id: 3),
        Item(title: 'Chinatown Market', id: 4),
        Item(title: 'Crocs', id: 5),
        Item(title: 'Crep Protect', id: 6),
        Item(title: 'Huf', id: 7),
        Item(title: 'Jason Markks', id: 8),
        Item(title: 'Jordan', id: 9),
        Item(title: 'Les Benjamins', id: 10),
        Item(title: 'Market', id: 11),
        Item(title: 'Nike', id: 12),
        Item(title: 'New Era', id: 13),
        Item(title: 'New Balance', id: 14),
        Item(title: 'On Running', id: 15),
        Item(title: 'Ortho Movement', id: 16),
        Item(title: 'Patagonia', id: 17),
        Item(title: 'Puma', id: 18),
        Item(title: 'Salomon', id: 19),
        Item(title: 'Saucony', id: 20),
        Item(title: 'Stussy', id: 21),
        Item(title: 'Stanley', id: 22),
        Item(title: 'Veja', id: 23),
      ])
    ],
    "Apparel": [
      SubMenuModel(title: "Show By Brand", id: 1, items: [
        Item(title: 'Adidas', id: 0),
        Item(title: 'Carhartt WIP', id: 2),
        Item(title: 'Carrots', id: 3),
        Item(title: 'Huf', id: 7),
        Item(title: 'Jordan', id: 9),
        Item(title: 'Les Benjamins', id: 10),
        Item(title: 'Market', id: 11),
        Item(title: 'Nike', id: 12),
        Item(title: 'New Balance', id: 14),
        Item(title: 'Patagonia', id: 17),
        Item(title: 'Puma', id: 18),
      ]),
      SubMenuModel(title: "Show By Category", id: 2, items: [
        Item(title: 'Tops', id: 19),
        Item(title: 'Bottoms', id: 20),
        Item(title: 'Outerwear', id: 21),
        Item(title: 'Sets', id: 22),
      ])
    ],
    "Accessories": [
      SubMenuModel(title: "Show By Brand", id: 1, items: [
        Item(title: 'Adidas', id: 0),
        Item(title: 'Carhartt WIP', id: 2),
        Item(title: 'Chinatown Market', id: 4),
        Item(title: 'Crep Protect', id: 6),
        Item(title: 'Huf', id: 7),
        Item(title: 'Jason Markks', id: 8),
        Item(title: 'Market', id: 11),
        Item(title: 'Nike', id: 12),
        Item(title: 'New Era', id: 13),
        Item(title: 'Ortho Movement', id: 16),
        Item(title: 'Patagonia', id: 17),
        Item(title: 'Puma', id: 18),
        Item(title: 'Stussy', id: 21),
        Item(title: 'Stanley', id: 22),
      ]),
      SubMenuModel(title: "Show By Category", id: 2, items: [
        Item(title: 'Caps', id: 23),
        Item(title: 'Socks', id: 24),
        Item(title: 'Shoe Care', id: 25),
        Item(title: 'Balls', id: 26),
        Item(title: 'Bags', id: 27),
      ])
    ],
    "New Arrivals": [],
    "Sale": [],
  };

  Map<String, List<SubMenuModel>> get allDepartment => _allDepartments;
  List<String> get allBrands => _allBrands;

  static final List<Product> _saleProducts = [
    Product(
      id: 'AD001',
      title: 'Adidas Ultraboost 22',
      description: '''
**Maximum Energy Return**

- Features Boost midsole for unmatched comfort.
- Primeknit upper for adaptive fit.

**Stylish and Functional**

- Ideal for running and casual wear.
  ''',
      price: 99.500,
      hasDiscount: true,
      discount: 11,
      brandName: 'Adidas',
      sku: 'ULTRA-BOOST-001',
      hasStock: true,
      totalStock: 120,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/ultraboost_22_1.jpg',
        'https://example.com/images/ultraboost_22_2.jpg'
      ],
      color: 'Black/White',
      discountTagline: 'Extra 11% OFF CHECKOUT',
      releaseDate: '2023-06-15',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '1001', totalStock: 50),
          Size(size: '9', id: '1002', totalStock: 40),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3001', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4001', totalStock: 35),
        ]),
      ],
    ),
    Product(
      id: 'AS002',
      title: 'Asics Gel-Nimbus 25',
      description: '''
**Plush Comfort**

- Updated GEL technology for softer landings.
- Breathable knit upper for enhanced airflow.

**Advanced Cushioning**

- Perfect for long-distance running.
  ''',
      price: 79.750,
      hasDiscount: true,
      discount: 11,
      brandName: 'Asics',
      sku: 'GEL-NIMBUS-25-002',
      hasStock: true,
      totalStock: 150,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: false,
      onSale: true,
      image: [
        'https://example.com/images/gel_nimbus_25_1.jpg',
        'https://example.com/images/gel_nimbus_25_2.jpg'
      ],
      color: 'Blue/Gray',
      discountTagline: 'Extra 11% OFF CHECKOUT',
      releaseDate: '2023-07-01',
      isReleased: 'Yes',
      gender: 'Women',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '7', id: '1003', totalStock: 60),
          Size(size: '8', id: '1004', totalStock: 40),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '6', id: '3003', totalStock: 20),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '40', id: '4003', totalStock: 30),
        ]),
      ],
    ),
    Product(
      id: 'NK003',
      title: 'Nike Air Force 1 \'07',
      description: '''
**Timeless Classic**

- Durable leather upper with iconic Air cushioning.
- Rubber outsole ensures traction.

**Everyday Icon**

- Perfect for casual wear or making a statement.
  ''',
      price: 89.500,
      hasDiscount: true,
      discount: 11,
      brandName: 'Nike',
      sku: 'AIR-FORCE-1-003',
      hasStock: true,
      totalStock: 200,
      isNew: false,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: false,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/air_force_1_1.jpg',
        'https://example.com/images/air_force_1_2.jpg'
      ],
      color: 'White',
      discountTagline: 'Extra 11% OFF CHECKOUT',
      releaseDate: '2022-05-10',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '1005', totalStock: 70),
          Size(size: '9', id: '1006', totalStock: 80),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3005', totalStock: 50),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4005', totalStock: 40),
        ]),
      ],
    ),
    Product(
      id: 'PU004',
      title: 'Puma RS-X3',
      description: '''
**Bold and Stylish**

- Mesh and textile upper with leather overlays.
- Retro-inspired design for streetwear lovers.

**Enhanced Comfort**

- Lightweight cushioning for all-day wear.
  ''',
      price: 60.250,
      hasDiscount: true,
      discount: 11,
      brandName: 'Puma',
      sku: 'RS-X3-004',
      hasStock: true,
      totalStock: 110,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: false,
      onSale: true,
      image: [
        'https://example.com/images/rs_x3_1.jpg',
        'https://example.com/images/rs_x3_2.jpg'
      ],
      color: 'Black/Red',
      discountTagline: 'Extra 11% OFF CHECKOUT',
      releaseDate: '2023-03-20',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '9', id: '1007', totalStock: 30),
          Size(size: '10', id: '1008', totalStock: 40),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '8', id: '3007', totalStock: 20),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '42', id: '4007', totalStock: 30),
        ]),
      ],
    ),
    Product(
      id: 'NB005',
      title: 'New Balance 574 Core',
      description: '''
**Classic Heritage Design**

- Suede and mesh upper for a premium look.
- EVA foam midsole for lightweight cushioning.

**Everyday Versatility**

- Durable rubber outsole for long-lasting wear.
  ''',
      price: 35.600,
      hasDiscount: true,
      discount: 11,
      brandName: 'New Balance',
      sku: '574-CORE-005',
      hasStock: true,
      totalStock: 150,
      isNew: false,
      category: 'Footwear',
      subCategory: 'casual',
      isFeatured: false,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/nb_574_core_1.jpg',
        'https://example.com/images/nb_574_core_2.jpg'
      ],
      color: 'Gray/White',
      discountTagline: 'Extra 11% OFF CHECKOUT',
      releaseDate: '2022-09-15',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '2001', totalStock: 50),
          Size(size: '10', id: '2002', totalStock: 50),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3009', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '40', id: '4010', totalStock: 20),
        ]),
      ],
    ),
    Product(
      id: 'RB006',
      title: 'Reebok Nano X3 Training Shoes',
      description: '''
**Built for Performance**

- Flexweave knit upper for durability.
- Responsive cushioning ideal for intense workouts.

**Designed for Athletes**

- Heel clip offers extra stability for heavy lifts.
  ''',
      price: 53.200,
      hasDiscount: true,
      discount: 11,
      brandName: 'Reebok',
      sku: 'NANO-X3-006',
      hasStock: true,
      totalStock: 80,
      isNew: true,
      category: 'Footwear',
      subCategory: 'training',
      isFeatured: true,
      isBestSeller: false,
      onSale: true,
      image: [
        'https://example.com/images/nano_x3_1.jpg',
        'https://example.com/images/nano_x3_2.jpg'
      ],
      color: 'White/Black',
      discountTagline: 'Extra 11% OFF CHECKOUT',
      releaseDate: '2023-04-05',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '9', id: '2011', totalStock: 30),
          Size(size: '10', id: '2012', totalStock: 30),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '8', id: '3011', totalStock: 20),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '42', id: '4011', totalStock: 30),
        ]),
      ],
    ),
    Product(
      id: 'UA007',
      title: 'Under Armour HOVR Phantom 3',
      description: '''
**Soft and Responsive**

- UA HOVR cushioning for zero-gravity feel.
- Breathable sock-like upper for snug comfort.

**Best for Running**

- Rubber outsole with enhanced traction for all surfaces.
  ''',
      price: 70.900,
      hasDiscount: true,
      discount: 11,
      brandName: 'Under Armour',
      sku: 'HOVR-PHANTOM-3-007',
      hasStock: true,
      totalStock: 120,
      isNew: false,
      category: 'Footwear',
      subCategory: 'running',
      isFeatured: false,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/hovr_phantom_3_1.jpg',
        'https://example.com/images/hovr_phantom_3_2.jpg'
      ],
      color: 'Blue/Orange',
      discountTagline: 'Extra 11% OFF CHECKOUT',
      releaseDate: '2022-10-20',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '9', id: '2013', totalStock: 40),
          Size(size: '10', id: '2014', totalStock: 40),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '8', id: '3013', totalStock: 20),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '42', id: '4013', totalStock: 30),
        ]),
      ],
    ),
    Product(
      id: 'CV008',
      title: 'Converse Chuck Taylor All Star High Tops',
      description: '''
**Timeless Streetwear**

- Iconic canvas upper with rubber toe cap.
- Durable and stylish for everyday wear.

**Versatile Icon**

- Great for casual outings and personal expression.
  ''',
      price: 33.700,
      hasDiscount: true,
      discount: 11,
      brandName: 'Converse',
      sku: 'CHUCK-TAYLOR-HI-008',
      hasStock: true,
      totalStock: 100,
      isNew: false,
      category: 'Footwear',
      subCategory: 'casual',
      isFeatured: false,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/chuck_taylor_hi_1.jpg',
        'https://example.com/images/chuck_taylor_hi_2.jpg'
      ],
      color: 'Black/White',
      discountTagline: 'Extra 11% OFF CHECKOUT',
      releaseDate: '2021-11-01',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '2015', totalStock: 50),
          Size(size: '9', id: '2016', totalStock: 50),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3015', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '40', id: '4015', totalStock: 20),
        ]),
      ],
    ),
    Product(
      id: 'VN009',
      title: 'Vans Old Skool',
      description: '''
**Iconic Skate Shoe**

- Suede and canvas upper for classic appeal.
- Padded collar for extra comfort.

**Perfect for Every Style**

- Signature waffle outsole for superior grip.
  ''',
      price: 38.600,
      hasDiscount: true,
      discount: 11,
      brandName: 'Vans',
      sku: 'OLD-SKOOL-009',
      hasStock: true,
      totalStock: 130,
      isNew: false,
      category: 'Footwear',
      subCategory: 'skate',
      isFeatured: false,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/old_skool_1.jpg',
        'https://example.com/images/old_skool_2.jpg'
      ],
      color: 'Black/White',
      discountTagline: 'Extra 11% OFF CHECKOUT',
      releaseDate: '2020-08-15',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '2017', totalStock: 50),
          Size(size: '9', id: '2018', totalStock: 50),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3017', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '40', id: '4017', totalStock: 30),
        ]),
      ],
    ),
    Product(
      id: 'SM010',
      title: 'Salomon Speedcross 5',
      description: '''
**Designed for Trail Running**

- Aggressive lugs for enhanced grip on all terrains.
- EnergyCell midsole for optimal cushioning.

**Built for the Outdoors**

- Durable and water-resistant materials.
  ''',
      price: 60.500,
      hasDiscount: true,
      discount: 11,
      brandName: 'Salomon',
      sku: 'SPEEDCROSS-5-010',
      hasStock: true,
      totalStock: 90,
      isNew: false,
      category: 'Footwear',
      subCategory: 'trail',
      isFeatured: true,
      isBestSeller: false,
      onSale: true,
      image: [
        'https://example.com/images/speedcross_5_1.jpg',
        'https://example.com/images/speedcross_5_2.jpg'
      ],
      color: 'Red/Black',
      discountTagline: 'Extra 11% OFF CHECKOUT',
      releaseDate: '2023-02-01',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '9', id: '2020', totalStock: 30),
          Size(size: '10', id: '2021', totalStock: 30),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '8', id: '3020', totalStock: 20),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '42', id: '4020', totalStock: 30),
        ]),
      ],
    )
  ];
  static final List<Product> _asicsProducts = [
    Product(
      id: 'P001',
      title: 'Asics Gel-Kayano 29',
      description: """
    **Overview**
    - Lightweight and responsive running shoe.
    - Perfect for long-distance training.

    **Features**
    - FF BLAST™ cushioning for superior comfort.
    - Breathable engineered mesh upper.

    **Additional Details**
    - Designed for overpronators seeking stability.
    """,
      price: 70.00,
      hasDiscount: true,
      discount: 15,
      discountTagline: '15% Off - Limited Time Offer!',
      brandName: 'Asics',
      sku: 'SKU001',
      hasStock: true,
      totalStock: 100,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: true,
      onSale: true,
      image: ['image1.jpg', 'image2.jpg'],
      color: 'Black/White',
      releaseDate: '2024-01-01',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(
          country: "US",
          sizes: [
            Size(size: "7", id: '1001', totalStock: 10),
            Size(size: "8", id: '1003', totalStock: 20),
            Size(size: "9", id: '1005', totalStock: 15),
          ],
        ),
        SizeGuide(
          country: "UK",
          sizes: [
            Size(size: "6", id: '3001', totalStock: 8),
            Size(size: "8", id: '3005', totalStock: 14),
          ],
        ),
        SizeGuide(
          country: "EU",
          sizes: [
            Size(size: "41", id: '4003', totalStock: 12),
            Size(size: "42", id: '4004', totalStock: 20),
          ],
        ),
      ],
    ),

    // Product 2: Footwear
    Product(
      id: 'P002',
      title: 'Asics GT-2000 11',
      description: """
    **Overview**
    - Versatile running shoe suitable for all terrains.

    **Features**
    - GEL™ technology for optimal shock absorption.
    - Durable rubber outsole for enhanced grip.

    **Additional Details**
    - Designed for daily training and recovery runs.
    """,
      price: 74.800,
      hasDiscount: false,
      discount: 0,
      discountTagline: '',
      brandName: 'Asics',
      sku: 'SKU002',
      hasStock: true,
      totalStock: 80,
      isNew: false,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: false,
      isBestSeller: true,
      onSale: false,
      image: ['image3.jpg', 'image4.jpg'],
      color: 'Blue/Yellow',
      releaseDate: '2023-11-15',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(
          country: "US",
          sizes: [
            Size(size: "8", id: '1003', totalStock: 30),
            Size(size: "9", id: '1005', totalStock: 20),
          ],
        ),
        SizeGuide(
          country: "UK",
          sizes: [
            Size(size: "7", id: '3003', totalStock: 25),
          ],
        ),
        SizeGuide(
          country: "EU",
          sizes: [
            Size(size: "42", id: '4004', totalStock: 35),
          ],
        ),
      ],
    ),

    // Product 3: Apparel (Outerwear)
    Product(
      id: 'P003',
      title: 'Asics Waterproof Running Jacket',
      description: """
    **Overview**
    - Lightweight and waterproof running jacket.

    **Features**
    - Reflective elements for enhanced visibility.
    - Adjustable hood and zippered pockets.

    **Additional Details**
    - Windproof design for extreme weather conditions.
    """,
      price: 35.000,
      hasDiscount: false,
      discount: 0,
      discountTagline: '',
      brandName: 'Asics',
      sku: 'SKU003',
      hasStock: true,
      totalStock: 60,
      isNew: true,
      category: 'Apparel',
      subCategory: 'Outerwear',
      isFeatured: true,
      isBestSeller: false,
      onSale: false,
      image: ['image5.jpg', 'image6.jpg'],
      color: 'Red/Black',
      releaseDate: '2024-02-01',
      isReleased: 'Yes',
      gender: 'Women',
      sizes: [
        SizeGuide(
          country: "US",
          sizes: [
            Size(size: "XS", id: '5001', totalStock: 10),
            Size(size: "S", id: '5002', totalStock: 15),
          ],
        ),
        SizeGuide(
          country: "UK",
          sizes: [
            Size(size: "XS", id: '5001', totalStock: 8),
          ],
        ),
      ],
    ),

    // Product 4: Accessories (Bags)
    Product(
      id: 'P004',
      title: 'Asics Training Backpack',
      description: """
    **Overview**
    - Compact and durable training backpack.

    **Features**
    - Multiple compartments for organized storage.
    - Padded straps for comfort.

    **Additional Details**
    - Water-resistant material for rainy conditions.
    """,
      price: 25.000,
      hasDiscount: true,
      discount: 20,
      discountTagline: '20% Off - Limited Time!',
      brandName: 'Asics',
      sku: 'SKU004',
      hasStock: true,
      totalStock: 50,
      isNew: false,
      category: 'Accessories',
      subCategory: 'Bags',
      isFeatured: false,
      isBestSeller: false,
      onSale: true,
      image: ['image7.jpg', 'image8.jpg'],
      color: 'Black',
      releaseDate: '2023-10-01',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(
          country: "US",
          sizes: [
            Size(size: "One Size", id: '6001', totalStock: 50),
          ],
        ),
      ],
    ),
    Product(
      id: 'P002',
      title: 'Asics GEL-Nimbus 25',
      description: '''
**Comfort Redefined**

- Ultra-soft cushioning with FF BLAST™ PLUS ECO foam.
- Engineered knit upper for improved breathability.
- Designed for long-distance runners.

**Performance Features**

- GEL™ technology for shock absorption.
- Lightweight and responsive midsole.
- Ortholite™ insole for extra comfort.
  ''',
      price: 92.000,
      hasDiscount: true,
      discount: 10,
      brandName: 'Asics',
      sku: 'GEL-N25-002',
      hasStock: true,
      totalStock: 220,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/gel_nimbus_25_1.jpg',
        'https://example.com/images/gel_nimbus_25_2.jpg'
      ],
      color: 'Blue/White',
      discountTagline: '10% Off for a Limited Time!',
      releaseDate: '2023-11-01',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '1003', totalStock: 50),
          Size(size: '9', id: '1005', totalStock: 45),
          Size(size: '10', id: '1006', totalStock: 30),
          Size(size: '11', id: '1008', totalStock: 40),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3003', totalStock: 40),
          Size(size: '8', id: '3005', totalStock: 35),
          Size(size: '9', id: '3006', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4003', totalStock: 55),
          Size(size: '42', id: '4004', totalStock: 60),
          Size(size: '44', id: '4006', totalStock: 50),
        ]),
      ],
    ),
    Product(
      id: 'P003',
      title: 'Asics MetaRun Jacket',
      description: '''
**All-Weather Running Companion**

- Water-repellent and wind-resistant material.
- Reflective details for low-light conditions.

**Designed for Movement**

- Ergonomic fit for unrestricted motion.
- Lightweight and packable for convenience.
  ''',
      price: 66.900,
      hasDiscount: false,
      discount: 0,
      brandName: 'Asics',
      sku: 'META-JCKT-003',
      hasStock: true,
      totalStock: 150,
      isNew: true,
      category: 'Apparel',
      subCategory: 'Outerwear',
      isFeatured: true,
      isBestSeller: false,
      onSale: false,
      image: [
        'https://example.com/images/metarun_jacket_1.jpg',
        'https://example.com/images/metarun_jacket_2.jpg'
      ],
      color: 'Black',
      discountTagline: '',
      releaseDate: '2023-10-15',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: 'S', id: '5002', totalStock: 40),
          Size(size: 'M', id: '5003', totalStock: 35),
          Size(size: 'L', id: '5004', totalStock: 45),
          Size(size: 'XL', id: '5005', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: 'M', id: '5003', totalStock: 40),
          Size(size: 'L', id: '5004', totalStock: 50),
          Size(size: 'XL', id: '5005', totalStock: 35),
        ]),
      ],
    ),
    Product(
      id: 'P004',
      title: 'Asics Running Socks - Lightweight',
      description: '''
**Keep Your Feet Happy**

- Ultra-thin and breathable material.
- Moisture-wicking for dry comfort.

**Perfect Fit**

- Arch support and seamless toe design.
- Anti-blister technology for long runs.
  ''',
      price: 2.000,
      hasDiscount: true,
      discount: 20,
      brandName: 'Asics',
      sku: 'RN-SCKS-004',
      hasStock: true,
      totalStock: 300,
      isNew: false,
      category: 'Accessories',
      subCategory: 'Socks',
      isFeatured: false,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/running_socks_1.jpg',
        'https://example.com/images/running_socks_2.jpg'
      ],
      color: 'White/Gray',
      discountTagline: '20% Off!',
      releaseDate: '2022-05-01',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: 'One Size', id: '6001', totalStock: 100),
        ]),
      ],
    ),
    Product(
      id: 'P005',
      title: 'Asics GT-2000 12',
      description: '''
**Trusted Stability**

- Dynamic DuoMax™ technology for enhanced support.
- GEL™ cushioning for shock absorption.

**For Everyday Running**

- Lightweight and durable design.
- Engineered mesh upper for ventilation.
  ''',
      price: 30.000,
      hasDiscount: true,
      discount: 15,
      brandName: 'Asics',
      sku: 'GT2000-12-005',
      hasStock: true,
      totalStock: 180,
      isNew: false,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/gt_2000_12_1.jpg',
        'https://example.com/images/gt_2000_12_2.jpg'
      ],
      color: 'Gray/Black',
      discountTagline: '15% Off for Running Enthusiasts!',
      releaseDate: '2023-09-20',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '1003', totalStock: 30),
          Size(size: '9', id: '1005', totalStock: 40),
          Size(size: '10', id: '1006', totalStock: 50),
          Size(size: '11', id: '1008', totalStock: 25),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3003', totalStock: 20),
          Size(size: '8', id: '3005', totalStock: 35),
          Size(size: '9', id: '3006', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4003', totalStock: 45),
          Size(size: '42', id: '4004', totalStock: 50),
          Size(size: '44', id: '4006', totalStock: 40),
        ]),
      ],
    ),
    Product(
      id: 'P006',
      title: 'Asics Novablast 3',
      description: '''
**Explosive Energy Return**

- FF BLAST™ PLUS foam for an energetic ride.
- Trampoline-inspired outsole design.

**Lightweight and Stylish**

- Jacquard mesh upper for breathability.
- Bold color options to stand out.
  ''',
      price: 50.000,
      hasDiscount: false,
      discount: 0,
      brandName: 'Asics',
      sku: 'NOVABLAST-3-006',
      hasStock: true,
      totalStock: 160,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: false,
      isBestSeller: true,
      onSale: false,
      image: [
        'https://example.com/images/novablast_3_1.jpg',
        'https://example.com/images/novablast_3_2.jpg'
      ],
      color: 'Orange/Black',
      discountTagline: '',
      releaseDate: '2023-11-10',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '1003', totalStock: 40),
          Size(size: '9', id: '1005', totalStock: 30),
          Size(size: '10', id: '1006', totalStock: 50),
          Size(size: '11', id: '1008', totalStock: 25),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3003', totalStock: 30),
          Size(size: '8', id: '3005', totalStock: 25),
          Size(size: '9', id: '3006', totalStock: 40),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4003', totalStock: 35),
          Size(size: '42', id: '4004', totalStock: 60),
          Size(size: '44', id: '4006', totalStock: 45),
        ]),
      ],
    ),
    Product(
      id: 'P007',
      title: 'Asics FujiTrail Backpack',
      description: '''
**Trail-Ready Design**

- 12L capacity for trail essentials.
- Adjustable straps for a custom fit.

**Features for Adventurers**

- Lightweight and water-resistant material.
- Includes hydration reservoir compartment.
  ''',
      price: 33.000,
      hasDiscount: true,
      discount: 10,
      brandName: 'Asics',
      sku: 'FUJITRAIL-BACKPACK-007',
      hasStock: true,
      totalStock: 80,
      isNew: true,
      category: 'Accessories',
      subCategory: 'Bags',
      isFeatured: true,
      isBestSeller: false,
      onSale: true,
      image: [
        'https://example.com/images/fujitrail_backpack_1.jpg',
        'https://example.com/images/fujitrail_backpack_2.jpg'
      ],
      color: 'Black/Yellow',
      discountTagline: 'Gear Up with 10% Off!',
      releaseDate: '2023-08-15',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: 'One Size', id: '6001', totalStock: 80),
        ]),
      ],
    ),

    Product(
      id: 'P008',
      title: 'Asics Court Speed FF 2',
      description: '''
**Built for Agility**

- FlyteFoam™ technology for lightweight cushioning.
- Durable outsole for high-impact movements.

**Court Performance**

- Designed for tennis players.
- Breathable mesh upper for long matches.
  ''',
      price: 42.550,
      hasDiscount: true,
      discount: 20,
      brandName: 'Asics',
      sku: 'COURT-SPD2-008',
      hasStock: true,
      totalStock: 120,
      isNew: false,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: false,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/court_speed_ff2_1.jpg',
        'https://example.com/images/court_speed_ff2_2.jpg'
      ],
      color: 'White/Blue',
      discountTagline: 'Smash the Court with 20% Off!',
      releaseDate: '2022-09-30',
      isReleased: 'Yes',
      gender: 'Women',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '6', id: '1001', totalStock: 30),
          Size(size: '7', id: '1003', totalStock: 25),
          Size(size: '8', id: '1005', totalStock: 40),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '4', id: '3001', totalStock: 20),
          Size(size: '5', id: '3003', totalStock: 35),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '37', id: '4001', totalStock: 30),
          Size(size: '38', id: '4003', totalStock: 40),
          Size(size: '39', id: '4005', totalStock: 35),
        ]),
      ],
    )
  ];

  static final List<Product> _nikeShoes = [
    Product(
      id: 'N001',
      title: 'Nike Air Zoom Pegasus 40',
      description: '''
**Reliable for Every Run**

- Zoom Air units for responsive cushioning.
- Lightweight and breathable upper.

**Enhanced Comfort**

- Midfoot band adapts to your foot for a secure fit.
  ''',
      price: 35.000,
      hasDiscount: true,
      discount: 10,
      brandName: 'Nike',
      sku: 'PEGASUS-40-001',
      hasStock: true,
      totalStock: 150,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/pegasus_40_1.jpg',
        'https://example.com/images/pegasus_40_2.jpg'
      ],
      color: 'Black/White',
      discountTagline: 'Fly Faster with 10% Off!',
      releaseDate: '2023-06-01',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '2001', totalStock: 40),
          Size(size: '9', id: '2002', totalStock: 50),
          Size(size: '10', id: '2003', totalStock: 60),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3001', totalStock: 40),
          Size(size: '8', id: '3002', totalStock: 50),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4001', totalStock: 60),
          Size(size: '42', id: '4002', totalStock: 70),
        ]),
      ],
    ),
    Product(
      id: 'N002',
      title: 'Nike Air Max 270',
      description: '''
**Bold Style Meets Comfort**

- Iconic Air Max cushioning for all-day wear.
- Sleek design for casual and athletic use.

**Lightweight and Durable**

- Breathable mesh upper with synthetic overlays.
  ''',
      price: 45.000,
      hasDiscount: false,
      discount: 0,
      brandName: 'Nike',
      sku: 'AIR-MAX-270-002',
      hasStock: true,
      totalStock: 200,
      isNew: false,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: true,
      onSale: false,
      image: [
        'https://example.com/images/air_max_270_1.jpg',
        'https://example.com/images/air_max_270_2.jpg'
      ],
      color: 'White/Red',
      discountTagline: '',
      releaseDate: '2022-08-15',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '9', id: '2005', totalStock: 60),
          Size(size: '10', id: '2006', totalStock: 80),
          Size(size: '11', id: '2007', totalStock: 60),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '8', id: '3005', totalStock: 50),
          Size(size: '9', id: '3006', totalStock: 60),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '42', id: '4005', totalStock: 70),
          Size(size: '43', id: '4006', totalStock: 80),
        ]),
      ],
    ),
    Product(
      id: 'N003',
      title: 'Nike ZoomX Invincible Run 3',
      description: '''
**Ultimate Cushioning**

- ZoomX foam for premium responsiveness.
- Widened midsole for stable strides.

**Built for Long Distances**

- Flyknit upper for durability and support.
  ''',
      price: 62.000,
      hasDiscount: true,
      discount: 20,
      brandName: 'Nike',
      sku: 'ZOOMX-RUN3-003',
      hasStock: true,
      totalStock: 120,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: false,
      onSale: true,
      image: [
        'https://example.com/images/zoomx_run3_1.jpg',
        'https://example.com/images/zoomx_run3_2.jpg'
      ],
      color: 'Blue/Green',
      discountTagline: '20% Off for Long Runs!',
      releaseDate: '2023-09-20',
      isReleased: 'Yes',
      gender: 'Women',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '6', id: '2001', totalStock: 30),
          Size(size: '7', id: '2002', totalStock: 40),
          Size(size: '8', id: '2003', totalStock: 50),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '4', id: '3001', totalStock: 20),
          Size(size: '5', id: '3002', totalStock: 35),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '37', id: '4001', totalStock: 40),
          Size(size: '38', id: '4002', totalStock: 45),
        ]),
      ],
    ),
    Product(
      id: 'N004',
      title: 'Nike Metcon 8',
      description: '''
**Built for Strength Training**

- Flat heel for enhanced stability.
- Rubber outsole provides grip during heavy lifts.

**Durable Design**

- Tough upper materials resist wear and tear.
  ''',
      price: 57.750,
      hasDiscount: false,
      discount: 0,
      brandName: 'Nike',
      sku: 'METCON-8-004',
      hasStock: true,
      totalStock: 90,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: false,
      isBestSeller: true,
      onSale: false,
      image: [
        'https://example.com/images/metcon_8_1.jpg',
        'https://example.com/images/metcon_8_2.jpg'
      ],
      color: 'Black/Gold',
      discountTagline: '',
      releaseDate: '2023-05-01',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '2001', totalStock: 20),
          Size(size: '9', id: '2002', totalStock: 30),
          Size(size: '10', id: '2003', totalStock: 40),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3001', totalStock: 25),
          Size(size: '8', id: '3002', totalStock: 35),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4001', totalStock: 30),
          Size(size: '42', id: '4002', totalStock: 40),
        ]),
      ],
    ),
    Product(
      id: 'N005',
      title: 'Nike Dunk Low Retro',
      description: '''
**Classic and Iconic**

- Leather upper for premium look and durability.
- Low-cut design for a retro vibe.

**Versatile Style**

- Perfect for casual wear and skateboarding.
  ''',
      price: 32.000,
      hasDiscount: true,
      discount: 15,
      brandName: 'Nike',
      sku: 'DUNK-LOW-RETRO-005',
      hasStock: true,
      totalStock: 130,
      isNew: false,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/dunk_low_retro_1.jpg',
        'https://example.com/images/dunk_low_retro_2.jpg'
      ],
      color: 'White/Black',
      discountTagline: 'Save 15% on the Classics!',
      releaseDate: '2022-11-10',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '2001', totalStock: 40),
          Size(size: '9', id: '2002', totalStock: 50),
          Size(size: '10', id: '2003', totalStock: 40),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3001', totalStock: 20),
          Size(size: '8', id: '3002', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4001', totalStock: 50),
          Size(size: '42', id: '4002', totalStock: 60),
        ]),
      ],
    ),
    Product(
      id: 'N006',
      title: 'Nike Free Run 5.0',
      description: '''
**Natural Movement**

- Minimal cushioning for barefoot-like flexibility.
- Lightweight design for dynamic runs.

**Breathable Comfort**

- Mesh upper ensures ventilation and flexibility.
  ''',
      price: 20.000,
      hasDiscount: true,
      discount: 5,
      brandName: 'Nike',
      sku: 'FREE-RUN-5-006',
      hasStock: true,
      totalStock: 100,
      isNew: false,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: false,
      isBestSeller: false,
      onSale: true,
      image: [
        'https://example.com/images/free_run_5_1.jpg',
        'https://example.com/images/free_run_5_2.jpg'
      ],
      color: 'Grey/Blue',
      discountTagline: 'Lightweight with 5% Off!',
      releaseDate: '2022-07-15',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '2001', totalStock: 30),
          Size(size: '9', id: '2002', totalStock: 40),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3001', totalStock: 25),
          Size(size: '8', id: '3002', totalStock: 35),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4001', totalStock: 40),
          Size(size: '42', id: '4002', totalStock: 50),
        ]),
      ],
    ),
    Product(
      id: 'N007',
      title: 'Nike Vapor Edge Pro 360',
      description: '''
**Speed and Traction**

- Wide stud placement for explosive cuts.
- Snug fit with a durable upper for speed.

**Designed for the Field**

- Lightweight materials for peak performance.
  ''',
      price: 25.000,
      hasDiscount: false,
      discount: 0,
      brandName: 'Nike',
      sku: 'VAPOR-EDGE-007',
      hasStock: true,
      totalStock: 80,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: false,
      onSale: false,
      image: [
        'https://example.com/images/vapor_edge_1.jpg',
        'https://example.com/images/vapor_edge_2.jpg'
      ],
      color: 'Red/Silver',
      discountTagline: '',
      releaseDate: '2023-03-01',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '9', id: '2005', totalStock: 30),
          Size(size: '10', id: '2006', totalStock: 50),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '8', id: '3005', totalStock: 20),
          Size(size: '9', id: '3006', totalStock: 40),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '42', id: '4005', totalStock: 50),
          Size(size: '43', id: '4006', totalStock: 60),
        ]),
      ],
    ),
    Product(
      id: 'N008',
      title: 'Nike Air Max 90',
      description: '''
**Timeless Design**

- Features iconic visible Air unit in the heel.
- Durable leather and mesh construction.

**Everyday Comfort**

- Cushioned midsole and padded collar for all-day wear.
  ''',
      price: 30.000,
      hasDiscount: true,
      discount: 10,
      brandName: 'Nike',
      sku: 'AIR-MAX-90-008',
      hasStock: true,
      totalStock: 120,
      isNew: false,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: true,
      onSale: true,
      image: [
        'https://example.com/images/air_max_90_1.jpg',
        'https://example.com/images/air_max_90_2.jpg'
      ],
      color: 'White/Infrared',
      discountTagline: 'Iconic Style, Now 10% Off!',
      releaseDate: '2022-03-15',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '2007', totalStock: 40),
          Size(size: '9', id: '2008', totalStock: 50),
          Size(size: '10', id: '2009', totalStock: 30),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3007', totalStock: 20),
          Size(size: '8', id: '3008', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4007', totalStock: 50),
          Size(size: '42', id: '4008', totalStock: 40),
        ]),
      ],
    ),
    Product(
      id: 'N009',
      title: 'Nike Phantom GX Academy',
      description: '''
**Built for Precision**

- Textured upper enhances ball control.
- Off-center lacing for a cleaner strike zone.

**Lightweight Design**

- Designed for speed and maneuverability on the field.
  ''',
      price: 55.000,
      hasDiscount: false,
      discount: 0,
      brandName: 'Nike',
      sku: 'PHANTOM-GX-009',
      hasStock: true,
      totalStock: 100,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: false,
      isBestSeller: false,
      onSale: false,
      image: [
        'https://example.com/images/phantom_gx_1.jpg',
        'https://example.com/images/phantom_gx_2.jpg'
      ],
      color: 'Black/Volt',
      discountTagline: '',
      releaseDate: '2023-07-10',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '2010', totalStock: 30),
          Size(size: '9', id: '2011', totalStock: 40),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3010', totalStock: 20),
          Size(size: '8', id: '3011', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4010', totalStock: 40),
          Size(size: '42', id: '4011', totalStock: 60),
        ]),
      ],
    ),
    Product(
      id: 'N010',
      title: 'Nike Pegasus Turbo Next Nature',
      description: '''
**High-Performance Running Shoe**

- Energy-returning ZoomX foam for smooth strides.
- Light and breathable Flyknit upper.

**Sustainable Materials**

- Made with at least 50% recycled content.
  ''',
      price: 64.000,
      hasDiscount: false,
      discount: 0,
      brandName: 'Nike',
      sku: 'PEGASUS-TURBO-010',
      hasStock: true,
      totalStock: 80,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: false,
      onSale: false,
      image: [
        'https://example.com/images/pegasus_turbo_1.jpg',
        'https://example.com/images/pegasus_turbo_2.jpg'
      ],
      color: 'Green/White',
      discountTagline: '',
      releaseDate: '2023-09-01',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '2012', totalStock: 20),
          Size(size: '9', id: '2013', totalStock: 30),
          Size(size: '10', id: '2014', totalStock: 30),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3012', totalStock: 20),
          Size(size: '8', id: '3013', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4012', totalStock: 40),
          Size(size: '42', id: '4013', totalStock: 40),
        ]),
      ],
    )
  ];

  static final List<Product> _categoryProducts = [
    Product(
      id: '001',
      title: 'Nike Air Max 90',
      description: 'Classic sneaker with premium cushioning.',
      price: 55.000,
      hasDiscount: false,
      discount: 0,
      brandName: 'Nike',
      sku: 'NA90-001',
      hasStock: true,
      totalStock: 231,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: false,
      onSale: false,
      image: ['image1.jpg', 'image2.jpg'],
      color: 'White/Black',
      discountTagline: '',
      releaseDate: '2024-10-01',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '1003', totalStock: 50),
          Size(size: '9', id: '1005', totalStock: 45),
          Size(size: '10', id: '1006', totalStock: 30),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7', id: '3003', totalStock: 60),
          Size(size: '8', id: '3005', totalStock: 46),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '41', id: '4003', totalStock: 35),
          Size(size: '42', id: '4004', totalStock: 40),
        ]),
      ],
    ),
    Product(
      id: '002',
      title: 'Adidas Ultraboost',
      description: 'High-performance running shoes with superior comfort.',
      price: 60.450,
      hasDiscount: false,
      discount: 0,
      brandName: 'Adidas',
      sku: 'AB-UB-002',
      hasStock: true,
      totalStock: 150,
      isNew: false,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: false,
      isBestSeller: true,
      onSale: false,
      image: ['image3.jpg', 'image4.jpg'],
      color: 'Black/Gold',
      discountTagline: '',
      releaseDate: '2024-09-15',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8.5', id: '1004', totalStock: 30),
          Size(size: '9', id: '1005', totalStock: 35),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '7.5', id: '3004', totalStock: 25),
          Size(size: '9', id: '3006', totalStock: 20),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '42', id: '4004', totalStock: 15),
          Size(size: '44', id: '4006', totalStock: 25),
        ]),
      ],
    ),
    Product(
      id: '003',
      title: 'Patagonia Fleece Jacket',
      description: 'Warm and eco-friendly fleece jacket.',
      price: 45.000,
      hasDiscount: false,
      discount: 0,
      brandName: 'Patagonia',
      sku: 'PATA-FJ-003',
      hasStock: true,
      totalStock: 90,
      isNew: true,
      category: 'Apparel',
      subCategory: 'Outerwear',
      isFeatured: false,
      isBestSeller: false,
      onSale: false,
      image: ['image5.jpg', 'image6.jpg'],
      color: 'Navy Blue',
      discountTagline: '',
      releaseDate: '2024-10-10',
      isReleased: 'Yes',
      gender: 'Women',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: 'S', id: '5002', totalStock: 20),
          Size(size: 'M', id: '5003', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: 'S', id: '5002', totalStock: 15),
          Size(size: 'L', id: '5004', totalStock: 25),
        ]),
      ],
    ),
    Product(
      id: '004',
      title: 'Jordan Backpack',
      description: 'Stylish and durable backpack for everyday use.',
      price: 33.000,
      hasDiscount: false,
      discount: 0,
      brandName: 'Jordan',
      sku: 'JB-004',
      hasStock: true,
      totalStock: 40,
      isNew: false,
      category: 'Accessories',
      subCategory: 'Bags',
      isFeatured: true,
      isBestSeller: true,
      onSale: false,
      image: ['image7.jpg'],
      color: 'Red/Black',
      discountTagline: '',
      releaseDate: '2024-05-20',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: 'One Size', id: '6001', totalStock: 40),
        ]),
      ],
    ),
    Product(
      id: '005',
      title: 'Puma Cali Sneaker',
      description: 'Retro-inspired sneaker with a bold silhouette.',
      price: 30.500,
      hasDiscount: false,
      discount: 0,
      brandName: 'Puma',
      sku: 'PUCALI-005',
      hasStock: true,
      totalStock: 120,
      isNew: false,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: false,
      isBestSeller: true,
      onSale: false,
      image: ['image8.jpg', 'image9.jpg'],
      color: 'White/Gum',
      discountTagline: '',
      releaseDate: '2024-07-01',
      isReleased: 'Yes',
      gender: 'Women',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '7', id: '1001', totalStock: 20),
          Size(size: '8', id: '1003', totalStock: 30),
          Size(size: '9', id: '1005', totalStock: 25),
        ]),
        SizeGuide(country: 'UK', sizes: [
          Size(size: '6.5', id: '3002', totalStock: 15),
          Size(size: '7.5', id: '3004', totalStock: 20),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '40', id: '4001', totalStock: 25),
          Size(size: '42', id: '4004', totalStock: 35),
        ]),
      ],
    ),
    Product(
      id: '006',
      title: 'Stussy Logo Cap',
      description: 'Classic cap featuring Stussy branding.',
      price: 15.000,
      hasDiscount: false,
      discount: 0,
      brandName: 'Stussy',
      sku: 'STCAP-006',
      hasStock: true,
      totalStock: 60,
      isNew: false,
      category: 'Accessories',
      subCategory: 'Caps',
      isFeatured: true,
      isBestSeller: false,
      onSale: false,
      image: ['image10.jpg'],
      color: 'Black',
      discountTagline: '',
      releaseDate: '2024-06-12',
      isReleased: 'Yes',
      gender: 'Men',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: 'One Size', id: '6001', totalStock: 60),
        ]),
      ],
    ),
    Product(
      id: '007',
      title: 'Carhartt WIP Cargo Pants',
      description: 'Utility-inspired cargo pants with rugged design.',
      price: 36.000,
      hasDiscount: false,
      discount: 0,
      brandName: 'Carhartt WIP',
      sku: 'CARG-007',
      hasStock: true,
      totalStock: 80,
      isNew: true,
      category: 'Apparel',
      subCategory: 'Bottoms',
      isFeatured: false,
      isBestSeller: false,
      onSale: false,
      image: ['image11.jpg', 'image12.jpg'],
      color: 'Olive Green',
      discountTagline: '',
      releaseDate: '2024-08-10',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: 'S', id: '5002', totalStock: 20),
          Size(size: 'M', id: '5003', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: 'L', id: '5004', totalStock: 15),
          Size(size: 'XL', id: '5005', totalStock: 15),
        ]),
      ],
    ),
    Product(
      id: '008',
      title: 'Adidas Soccer Ball',
      description: 'Durable soccer ball for professional training.',
      price: 23.600,
      hasDiscount: false,
      discount: 0,
      brandName: 'Adidas',
      sku: 'ADBALL-008',
      hasStock: true,
      totalStock: 100,
      isNew: false,
      category: 'Accessories',
      subCategory: 'Balls',
      isFeatured: true,
      isBestSeller: true,
      onSale: false,
      image: ['image13.jpg'],
      color: 'White/Black',
      discountTagline: '',
      releaseDate: '2024-04-18',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: 'One Size', id: '6001', totalStock: 100),
        ]),
      ],
    ),
    Product(
      id: '009',
      title: 'Veja V-10 Sneakers',
      description: 'Eco-friendly sneakers with timeless style.',
      price: 45.000,
      hasDiscount: false,
      discount: 0,
      brandName: 'Veja',
      sku: 'VJ-V10-009',
      hasStock: true,
      totalStock: 75,
      isNew: true,
      category: 'Footwear',
      subCategory: 'footwear',
      isFeatured: true,
      isBestSeller: false,
      onSale: false,
      image: ['image14.jpg', 'image15.jpg'],
      color: 'White/Navy',
      discountTagline: '',
      releaseDate: '2024-10-05',
      isReleased: 'Yes',
      gender: 'Women',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: '8', id: '1003', totalStock: 25),
          Size(size: '9', id: '1005', totalStock: 30),
        ]),
        SizeGuide(country: 'EU', sizes: [
          Size(size: '42', id: '4004', totalStock: 20),
        ]),
      ],
    ),
    Product(
      id: '010',
      title: 'Jason Markks Shoe Care Kit',
      description: 'Essential cleaning kit for sneaker care.',
      price: 8.450,
      hasDiscount: false,
      discount: 0,
      brandName: 'Jason Markks',
      sku: 'JM-CARE-010',
      hasStock: true,
      totalStock: 50,
      isNew: false,
      category: 'Accessories',
      subCategory: 'Shoe Care',
      isFeatured: false,
      isBestSeller: true,
      onSale: false,
      image: ['image16.jpg'],
      color: 'Neutral',
      discountTagline: '',
      releaseDate: '2024-02-14',
      isReleased: 'Yes',
      gender: 'Unisex',
      sizes: [
        SizeGuide(country: 'US', sizes: [
          Size(size: 'One Size', id: '6001', totalStock: 50),
        ]),
      ],
    )
  ];
  List<Product> get asicProducts => _asicsProducts;
  List<Product> get nikeShoes => _nikeShoes;
  List<Product> get saleProducts => _saleProducts;
  List<Product> get categoryProducts => _categoryProducts;
}
