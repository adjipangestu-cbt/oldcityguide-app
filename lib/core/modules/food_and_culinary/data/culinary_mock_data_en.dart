import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';

/// English introduction for each culinary culture category
const Map<CulinaryCulture, ({String judul, String pengantar})>
    culinaryCultureIntroEn = {
  CulinaryCulture.arab: (
    judul: 'Arab Culinary Heritage',
    pengantar:
        'The Arab community, particularly the Hadhrami diaspora from Yemen, began settling across various cities in Indonesia during the 19th century, including Malang. Their arrival was tied not only to maritime and inland trade, but also to the spread of Islam and the establishment of influential socio-economic networks.\n\nOver time, sustained interaction between the Arab settlers and the local Javanese population fostered rich cultural acculturation, most visibly expressed in culinary traditions. Middle Eastern dishes were adapted to incorporate local indigenous ingredients, cooking techniques, and Indonesian palate preferences.\n\nThrough the lens of hybrid culture, Arab cuisine in Indonesia is no longer viewed as purely Middle Eastern, but rather as an organic fusion of Arab and Indonesian archipelago (Nusantara) heritage.',
  ),
  CulinaryCulture.jawa: (
    judul: 'Javanese Culinary Heritage',
    pengantar:
        'Traditional Javanese cuisine in Malang has evolved into a vital pillar of the community\'s daily life. Rooted in an agrarian heritage that celebrated local harvest and indigenous spices, the people of Malang created an array of dishes that are hearty, unpretentious, yet remarkably complex in flavor. During the colonial era, expanding commerce and urban growth further enriched local culinary repertoire without compromising the authentic Javanese character passed down across generations.\n\nTo this day, numerous legendary eateries and warungs faithfully preserve original family recipes that have endured for decades—some for over a century. Iconic specialties such as rawon, pecel, sate gebug, bakso, and traditional delicacies bear witness to the historical journey of Malang, reflecting the communal warmth, hospitality, and local wisdom of its people.',
  ),
  CulinaryCulture.eropa: (
    judul: 'European Culinary Heritage',
    pengantar:
        'The development of European culinary heritage in Malang is inextricably linked to the Dutch colonial era from the late 19th to the mid-20th century. During this period, Malang flourished as a plantation hub and a favored hill station retreat for Europeans drawn by its cool, refreshing mountain climate.\n\nAlongside the expansion of colonial residential quarters, European-style restaurants, bakeries, coffee shops, and dining halls emerged to cater to Dutch residents, Chinese merchants, and the native indigenous elite.\n\nAlthough the colonial era has long passed, several heritage buildings and culinary legacies endure to this day. The most prominent example is Toko Oen, which preserves not only time-honored recipes, but also its authentic colonial architecture and nostalgic ambience as a living historical landmark.',
  ),
  CulinaryCulture.cina: (
    judul: 'Chinese Culinary Heritage',
    pengantar:
        'The Chinese community began to flourish in Malang during the 19th century, particularly after the Dutch colonial government opened extensive coffee, sugarcane, and tobacco plantations across the region. Their presence played an instrumental role not only in trade and commerce, but also in transforming the city\'s culinary landscape.\n\nIn the downtown core—notably around Pasar Besar, Kayutangan, and Malang\'s Chinatown (Pecinan)—numerous eateries opened, serving noodle dishes, wontons, meatballs, spring rolls, and traditional beverages. Over the decades, these dishes adapted to suit the Muslim-majority population, replacing pork with chicken or beef and adjusting spice profiles to local tastes.\n\nThis evolutionary process gave rise to Peranakan cuisine, a distinctive fusion of Chinese culinary tradition and local Javanese culture. Consequently, many of Malang\'s hallmark delicacies today are no longer purely Chinese, but rather vibrant expressions of a hybrid culture that defines the gastronomic identity of Malang.',
  ),
};

final List<FoodCulinaryDto> culinaryMockDataEn = [
  // ────────────────────────── ARAB ──────────────────────────
  const FoodCulinaryDto(
    id: 1,
    slug: 'lumpur-arab-legenda',
    name: 'Lumpur Arab Legenda',
    culture: CulinaryCulture.arab,
    yearEstablished: '1960',
    address: 'Jl. Kauman No. 9A & Jl. Soekarno Hatta No. 32, Kota Malang',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Lumpur+Arab+Legenda+Malang',
    imageUrls: [
      'assets/images/culinary_extracted/Lumpur_arab1.PNG',
      'assets/images/culinary_extracted/Lumpur_arab2.PNG',
      'assets/images/culinary_extracted/Lumpur_arab3.PNG',
    ],
    latitude: -7.9756, // TODO: verifikasi koordinat
    longitude: 112.6296, // TODO: verifikasi koordinat
    desc:
        'Lumpur Arab Legenda is one of Malang\'s legendary culinary institutions, cherished since 1960. This family enterprise originated from an ancestral recipe passed down through a Yemeni-Arab family, eventually evolving into one of Malang\'s most iconic souvenir delicacies. To this day, Lumpur Arab Legenda preserves the authentic taste transmitted across generations. The bakery currently operates outlets on Jalan Kauman No. 9A and Jalan Soekarno Hatta No. 32, making it readily accessible to locals and tourists alike.\n\nThe hallmark of Lumpur Arab Legenda lies in its unwavering consistency in upholding traditional recipes for over six decades. The kue lumpur (traditional mud cake) is crafted from wholesome ingredients including potatoes, coconut milk, eggs, butter, and wheat flour, yielding a dense, tender, and fragrant texture. Its signature feature is a generous topping of raisins that imparts a delicate sweetness and serves as an unmistakable visual identity. Over the years, alongside the original variant, modern flavors such as cheese, chocolate, pandan, and various toppings have been introduced, all while respecting the traditional foundation.\n\nThe moniker "Lumpur Arab" reflects the heritage of the founding family from Malang\'s historic Arab community. This delicacy stands as a testament to the longstanding cultural acculturation between Arab settlers and Indonesian society. Although rooted in an Arab family recipe, the ingredients and flavors were harmoniously tailored to the local palate, producing a beloved treat embraced across cultures. It demonstrates how cultural exchange thrives not just through language and traditions, but through an evolving culinary heritage.\n\nA visit to Lumpur Arab Legenda offers a taste of timeless traditional pastry that remains beloved amidst modern food trends. Freshly baked kue lumpur exudes an enticing aroma of butter and coconut milk, melting softly in your mouth with every bite. Many travelers pick up boxes as gifts due to their consistent quality and good shelf life. Beyond being a neighborhood favorite in Malang, Lumpur Arab Legenda is a must-visit destination for anyone wishing to savor a classic pastry steeped in rich cultural history.',
  ),
  const FoodCulinaryDto(
    id: 2,
    slug: 'warung-sate-gule-cairo',
    name: 'Warung Sate Gule Cairo',
    culture: CulinaryCulture.arab,
    yearEstablished: '1953',
    address: 'Jl. Kapten Piere Tendean No.1, Kasin, Kec. Klojen, Kota Malang, Jawa Timur 65117',
    mapsUrl: 'https://maps.app.goo.gl/yDd1txg3oYaioM8y9',
    imageUrls: [
      'assets/images/culinary_extracted/sate_gule1.PNG',
      'assets/images/culinary_extracted/sate_gule2.PNG',
      'assets/images/culinary_extracted/sate_gule3.PNG',
    ],
    latitude: -7.9722, // TODO: verifikasi koordinat
    longitude: 112.6316, // TODO: verifikasi koordinat
    desc:
        'For lovers of goat and mutton dishes, Rumah Makan Cairo (affectionately known as Warung Sate Gule Cairo) is a living legend in Malang. Established in 1953, this restaurant has spanned multiple generations while steadfastly preserving authentic Middle Eastern flavors in the historic Embong Arab district. The hallmark that keeps diners flocking back is their masterful preparation of goat meat, making it exceptionally tender, savory, and entirely devoid of any gamey odor.\n\nLocated on Jl. Kapten Piere Tendean No. 1, Klojen, Malang, this culinary landmark welcomes guests daily from 08:00 to 22:00 WIB, opening at 13:00 WIB on Fridays following Friday congregational prayers. In addition to the main restaurant in Malang, they have expanded with a branch on Jl. Panglima Sudirman No. 62 in Batu City, allowing vacationers there to relish their specialties with ease.\n\nWhen visiting, the must-try signature dish is the Sate Kambing Tanpa Lemak (lean mutton satay), served with generous skewers of succulent meat priced at around Rp40,000 for 10 skewers. Another star attraction is the Gule Kambing (spiced mutton curry stew), priced between Rp35,000 and Rp49,000, renowned for its golden, aromatic broth that is intensely flavorful yet light on the palate. You can complete your feast with aromatic Nasi Kebuli (spiced rice) or flaky Roti Maryam for dessert, with main courses generally ranging from Rp40,000 to Rp50,000.\n\nA handy tip if you plan to visit the main Malang location by car: parking space directly out front is very limited, accommodating only one or two vehicles. Arriving early outside peak dinner hours or opting for ride-hailing services will make your dining experience far more relaxed and convenient.',
  ),

  // ────────────────────────── JAWA ──────────────────────────
  const FoodCulinaryDto(
    id: 3,
    slug: 'nasi-jagung-bu-muslikah',
    name: 'Nasi Jagung Bu Muslikah',
    culture: CulinaryCulture.jawa,
    yearEstablished: '',
    address: 'Jalan Candi, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65115',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Nasi+Jagung+Bu+Muslikah+Malang',
    imageUrls: [
      'assets/images/culinary_extracted/Nasi_jagung1.PNG',
      'assets/images/culinary_extracted/Nasi_jagung2.PNG',
      'assets/images/culinary_extracted/Nasi_jagung3.PNG',
    ],
    latitude: -8.0039, // TODO: verifikasi koordinat
    longitude: 112.6126, // TODO: verifikasi koordinat
    desc:
        'Warung Bu Muslikah has long been celebrated as an iconic purveyor of nasi jagung (corn rice) in Malang. Situated in Karangbesuki near university campuses and student boarding houses, this humble warung is bustling every morning. A steaming plate of corn rice is served with rustic side dishes including hearty sayur lodeh (vegetables in coconut stew), salted fish, fried tempeh, and a distinctively fiery sambal terasi.\n\nWith pocket-friendly prices and authentic flavors, Bu Muslikah preserves the comforting, savory essence of traditional East Javanese home cooking. Open from 08:30 to 12:00 noon, many patrons come not merely to eat, but to reminisce in the nostalgic, warm ambience of a countryside home. Crowds gather from early morning to savor corn rice accompanied by urap-urap (spiced grated coconut salad), mendol (seasoned fried tempeh patties), and crispy salted fish. Priced at around Rp12,000, a serving here is not only deeply satisfying, but also delivers an unforgettable taste of authentic heritage.',
  ),
  const FoodCulinaryDto(
    id: 4,
    slug: 'pos-ketan-legenda-1967',
    name: 'Pos Ketan Legenda 1967',
    culture: CulinaryCulture.jawa,
    yearEstablished: '1967',
    address: 'Alun-Alun Batu, Kota Batu',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Pos+Ketan+Legenda+1967+Batu',
    imageUrls: [
      'assets/images/culinary_extracted/Pos_ketan1.PNG',
      'assets/images/culinary_extracted/Pos_ketan2.PNG',
      'assets/images/culinary_extracted/Pos_ketan3.PNG',
    ],
    latitude: -7.8714,
    longitude: 112.5245,
    desc:
        'Pos Ketan Legenda 1967 is one of the most famous culinary landmarks in Batu City, East Java. The business was founded in 1967 by Bu Siami, who sold simple sticky rice in front of the post office near Batu City Square (Alun-Alun Batu). Because of this location, locals began referring to it as "Pos Ketan" (The Sticky Rice Post). Over time, the venture was carried forward by her son, Pak Sugeng, and is currently managed by third-generation successor Pak Supri, enduring as a legendary family business for over five decades.\n\nThe uniqueness of Pos Ketan Legenda 1967 lies in its ingenuity in transforming humble traditional fare into a timeless delicacy beloved across generations. While it originally served sticky rice topped merely with grated coconut and roasted soybean powder, the stall now offers dozens of toppings, ranging from sweetened condensed milk and cheese, chocolate, durian, jackfruit, and banana, to various sweet and savory pairings. Despite continuous creative innovation to match modern tastes, the core texture of tender, fragrant sticky rice remains uncompromised. This balance of innovation and tradition has allowed Pos Ketan Legenda to flourish amidst modern culinary trends.\n\nPos Ketan Legenda exemplifies the philosophy that traditional food can thrive continuously when it adapts without losing its soul. Sticky rice (ketan), an age-old staple of Javanese culinary culture, is reimagined with contemporary flair to appeal to younger generations. This harmonious blend of ancestral recipe and modern toppings makes the stall a prime example of how local culinary heritage can evolve with the times while honoring its cultural roots.\n\nA visit to Pos Ketan Legenda offers a quintessential evening experience, particularly when Batu City Square comes alive with vacationers. Visitors can relish warm, freshly steamed sticky rice with their topping of choice while soaking up the vibrant, breezy atmosphere of the resort town. The ever-present queue is a testament to the enduring popularity of this iconic street food. Its prime location near the square makes it an essential stop after exploring Batu\'s attractions.\n\nToday, Pos Ketan Legenda 1967 remains a culinary symbol of Batu City. Its triumph in safeguarding traditional quality while embracing contemporary creations makes it not only a tourist hotspot, but also an inspiring model of how cultural heritage can be successfully passed down to future generations. As an East Javanese culinary legend, Pos Ketan Legenda proves that a simple, rustic dish can evolve into a beloved regional identity known to travelers nationwide.',
  ),
  const FoodCulinaryDto(
    id: 5,
    slug: 'pecel-kawi-hj-musilah',
    name: 'Rumah Makan Pecel Kawi Hj. Musilah',
    culture: CulinaryCulture.jawa,
    yearEstablished: '1975',
    address: 'Jl. Kawi Atas No. 43B, Kota Malang',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Pecel+Kawi+Hj+Musilah+Malang',
    imageUrls: [
      'assets/images/culinary_extracted/Rumah_makan1.PNG',
      'assets/images/culinary_extracted/Rumah_makan2.PNG',
      'assets/images/culinary_extracted/Rumah_makan3.PNG',
    ],
    latitude: -7.9827,
    longitude: 112.6193,
    desc:
        'Rumah Makan Pecel Kawi Hj. Musilah is a culinary legend that has been an icon of Malang since 1975. Founded by Hj. Musilah, this dining institution began as a modest eatery serving authentic East Javanese nasi pecel based on a cherished family recipe that remains unchanged today. Located on Jalan Kawi Atas No. 43B, Klojen, it has grown into a favored culinary destination for both Malang locals and travelers seeking an authentic pecel experience. The business continues to be managed across generations by the founder\'s family, ensuring that the caliber of flavor and traditional presentation are carefully preserved.\n\nThe hallmark of Pecel Kawi Hj. Musilah lies in its thick, aromatic peanut sauce that balances savory, sweet, and gently spicy notes. Distinctive aromatic undertones of kencur (aromatic ginger) and kaffir lime leaves set it apart from pecel varieties in other regions. The blanched vegetables are always served crisp and fresh, crowned with crunchy rempeyek (peanut crackers), tempeh, and a wide choice of hearty side dishes such as eggs, sweet-savory fried beef (empal), fried chicken, and spiced beef skewers (sate komoh). Guests can also choose their preferred spice level, tailoring the dish to their personal liking.\n\nThis restaurant not only maintains traditional craftsmanship, but also showcases the richness of East Javanese gastronomic culture. Nasi pecel, originally everyday peasant fare, has risen to become a celebrated pillar of Malang\'s food identity. Through unwavering taste consistency and ancestral recipes handed down through generations, Pecel Kawi Hj. Musilah proves that heritage cuisine can thrive and remain deeply cherished amidst shifting food trends. Its longevity highlights how culinary heritage forms an essential cultural treasure worthy of continuous preservation.\n\nA visit to Pecel Kawi Hj. Musilah offers an unforgettable breakfast or lunch experience in a warm, unpretentious setting. The restaurant is lively from early morning as residents and travelers gather for their morning meal. Beyond enjoying a flavorful plate of pecel, guests can immerse themselves in the nostalgic atmosphere of an establishment that has shaped Malang\'s food story for over half a century. Rumah Makan Pecel Kawi Hj. Musilah Asli 1975 remains an essential stop for anyone eager to explore the authentic flavors and enduring culinary heritage of Malang.',
  ),
  const FoodCulinaryDto(
    id: 6,
    slug: 'warung-lama-h-ridwan',
    name: 'Warung Lama H. Ridwan',
    culture: CulinaryCulture.jawa,
    yearEstablished: '1925',
    address: 'Jalan KH Ahmad Dahlan, Kota Malang (di lorong Pasar Besar Malang)',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Warung+Lama+H+Ridwan+Malang',
    imageUrls: [
      'assets/images/culinary_extracted/Warung_lama1.PNG',
      'assets/images/culinary_extracted/Warung_lama2.PNG',
      'assets/images/culinary_extracted/Warung_lama3.PNG',
    ],
    latitude: -7.9770,
    longitude: 112.6295,
    desc:
        'Warung Lama H. Ridwan is one of the oldest food stalls in Malang, woven into the city\'s culinary fabric since 1925. According to the founder\'s family, H. Ridwan began selling food as early as 1919 using shoulder baskets (pikulan) around the Pasar Besar area. The year 1925 marks its official founding when Pasar Besar Malang was constructed and a permanent stall was established—the very stall it occupies today. More than a century later, the warung stands steadfast in the exact same spot, lovingly run by the third generation of the H. Ridwan family.\n\nThe distinction of Warung Lama H. Ridwan lies in its remarkable ability to preserve traditional Malang home-cooked flavors consistently through the generations. The menu features time-tested East Javanese staples including rawon, soto, gule, krengsengan (sweet-savory stewed beef), fried chicken, and sate komoh—a signature dish since its founding. Sate komoh itself is a heritage Malang specialty of tender beef skewers in rich coconut seasoning that is increasingly rare today, making its presence a prized draw for both tourists and locals craving heritage flavors.\n\nWarung Lama H. Ridwan offers far more than a meal; it embodies rich living history. Established long before Indonesian independence, this family-run culinary venture has weathered the Dutch colonial period, the Japanese occupation, and the modern expansion of Malang. Ancestral recipes are meticulously maintained, ensuring every bite evokes the warmth and authenticity of old-time home cooking. This steadfast consistency establishes Warung Lama H. Ridwan as a true bastion of Malang\'s gastronomic heritage.\n\nA visit to Warung Lama H. Ridwan is a unique culinary adventure, tucked inside the lively interior corridors of Pasar Besar Malang. The vibrant hustle of the traditional market coupled with the rich aroma of simmering spices creates a nostalgic atmosphere impossible to replicate in modern establishments. Multigenerational patrons who have frequented the stall for decades regularly return with their children and grandchildren. This continuity turns Warung Lama H. Ridwan into a vessel of shared family memories.\n\nToday, Warung Lama H. Ridwan remains an essential culinary pilgrimage for anyone visiting Malang. Its preservation of century-old recipes, historic location, and family stewardship prove that food is not merely nourishment, but a profound expression of culture and urban history.',
  ),
  const FoodCulinaryDto(
    id: 7,
    slug: 'warung-sate-gebug-1920',
    name: 'Warung Sate Gebug 1920',
    culture: CulinaryCulture.jawa,
    yearEstablished: '1920',
    address: 'Jl. Jenderal Basuki Rahmat No. 113A, Kayutangan, Kota Malang',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Warung+Sate+Gebug+1920+Malang',
    imageUrls: [
      'assets/images/culinary_extracted/Warung_sate1.PNG',
      'assets/images/culinary_extracted/Warung_sate2.PNG',
      'assets/images/culinary_extracted/Warung_sate3.PNG',
    ],
    latitude: -7.9758,
    longitude: 112.6318,
    desc:
        'Warung Sate Gebug 1920 is a celebrated culinary icon of Malang, operating since 1920. Situated in the historic Kayutangan heritage corridor on Jalan Jenderal Basuki Rahmat No. 113A, this eatery has witnessed over a century of history, spanning the Dutch colonial era to modern times. Now run by the third generation of the founding family, it continues to safeguard ancestral recipes and cooking techniques for more than a hundred years. The building itself preserves its vintage structure and is officially recognized as part of the Kayutangan cultural heritage conservation area.\n\nThe signature feature of Warung Sate Gebug stems from its beef tenderizing technique, which gives the dish its name. Before grilling, choice cuts of beef are pounded ("digebug") repeatedly until the muscle fibers soften. This time-honored method creates an exceptionally tender texture without losing the meat\'s natural succulent juices. The beef is then marinated in a blend of traditional spices and grilled over red-hot charcoal, imparting an intoxicating smoky aroma. This grilling craftsmanship has been preserved since day one, setting Sate Gebug apart from conventional beef satays.\n\nIn addition to sate gebug, the eatery offers classic beef delicacies such as rawon, soto, and clear beef soup. Diners typically pair their satay skewers with a rich bowl of rawon or soto broth, complemented by crispy fried tempeh and traditional mendol patties. This combination reflects the richness of East Javanese gastronomy—uncomplicated yet bursting with robust flavor. High-grade ingredients and century-old consistency explain why Warung Sate Gebug remains a favorite among locals and visiting gastronomes alike.\n\nVisiting Warung Sate Gebug 1920 is not just about savoring a delicious meal; it is an immersive journey into the vintage atmosphere of historic Kayutangan. The rustic architecture, traditional charcoal grilling pit, and tantalizing aromas rising from the embers deliver an unforgettable, authentic encounter. Centrally located in downtown Malang, it serves as a natural culinary highlight after exploring Kayutangan Heritage Village. Warung Sate Gebug 1920 is a must-see destination for travelers eager to experience a living culinary tradition over a century in the making.',
  ),
  const FoodCulinaryDto(
    id: 8,
    slug: 'orem-orem-arema',
    name: 'Orem-orem Arema',
    culture: CulinaryCulture.jawa,
    yearEstablished: '1955',
    address: 'Jl. Galunggung No.56f, Gading Kasri, Kec. Klojen, Kota Malang, Jawa Timur 65115',
    mapsUrl: 'https://maps.app.goo.gl/yngHp4uXSMYxvpcUA',
    imageUrls: [
      'assets/images/culinary_extracted/Orem_orem1.PNG',
      'assets/images/culinary_extracted/Orem_orem2.PNG',
      'assets/images/culinary_extracted/Orem_orem3.PNG',
    ],
    latitude: -7.9786, // TODO: verifikasi koordinat
    longitude: 112.6186, // TODO: verifikasi koordinat
    desc:
        'Orem-orem is an authentic culinary specialty native to Malang, featuring a fragrant coconut milk broth infused with savory tempeh. A typical serving consists of sliced ketupat (compressed rice cakes) drenched in coconut curry with seasoned tempeh and shredded chicken, topped with fresh bean sprouts, and served alongside mendol (spiced tempeh fritters) or crispy fried tempeh. Orem-orem is known for its mildly spicy, aromatic character. To round out the dish, you can drizzle sweet soy sauce and add crunchy kerupuk crackers.\n\nOrem-orem Arema is open daily except Fridays, from 09:30 to 15:30 WIB. A hearty bowl here features rice cakes generously covered with tempeh curry, chicken, and fried tempeh. Diners can choose to add a boiled egg or enjoy it regular. A bowl of orem-orem at Orem-orem Arema is delightfully affordable, priced between Rp8,000 and Rp12,000.\n\nThe charm of orem-orem lies in the interplay of well-marinated tempeh, golden coconut broth scented with lemongrass and kaffir lime leaves, and a sprinkle of crispy fried shallots that enhances its savory profile. Simmering the stew gently over low heat yields a silky, consistent soup texture. Orem-orem endures as a beloved local breakfast staple, preserved through generations by proud family-run warungs.',
  ),
  const FoodCulinaryDto(
    id: 9,
    slug: 'rawon-brintik',
    name: 'Rawon Brintik',
    culture: CulinaryCulture.jawa,
    yearEstablished: '1942',
    address: 'Jl. KH Ahmad Dahlan No.39, Sukoharjo, Kec. Klojen, Kota Malang, Jawa Timur 65118',
    mapsUrl: 'https://maps.app.goo.gl/RWu7ranBHUAuNL41A',
    imageUrls: [
      'assets/images/culinary_extracted/Rawon_brintik1.PNG',
      'assets/images/culinary_extracted/Rawon_brintik2.PNG',
      'assets/images/culinary_extracted/Rawon_brintik3.PNG',
    ],
    latitude: -7.9752, // TODO: verifikasi koordinat
    longitude: 112.6357, // TODO: verifikasi koordinat
    desc:
        'Rawon Brintik is the oldest surviving rawon establishment in Malang. Founded in 1942, this storied warung has served generations of diners for over eight decades, faithfully preserving the deep, rich flavors of black beef soup that made it famous from its earliest days.\n\nBeyond rawon, Rawon Brintik also serves other comforting homestyle dishes, including Semur Daging (braised sweet beef stew), Nasi Bumbu Rujak Ayam (spicy-tangy chicken with rice), Nasi Kare Ayam Kampung (free-range chicken curry), and Nasi Campur (mixed rice). A selection of classic beverages pairs wonderfully with the meal, such as hot coffee, sweet tea, iced citrus juice, and traditional syrups. A hearty serving of rawon is priced around Rp20,000.\n\nThe rawon here is celebrated for its dark, deeply flavorful, and robust broth (known locally as "mlekoh"), brimming with large cuts of melt-in-your-mouth tender beef. In addition to rawon, their savory beef semur is a perennial guest favorite.',
  ),
  const FoodCulinaryDto(
    id: 10,
    slug: 'soto-lombok-malang',
    name: 'Soto Lombok Malang',
    culture: CulinaryCulture.jawa,
    yearEstablished: '1955',
    address: 'Jl. Sulawesi No.1 / Jl. Lombok No.1, Kasin, Kec. Klojen, Kota Malang',
    mapsUrl: 'https://maps.app.goo.gl/rxESh4T2maE8EJbQA',
    imageUrls: [
      'assets/images/culinary_extracted/Soto_lombok1.PNG',
      'assets/images/culinary_extracted/Soto_lombok2.PNG',
      // Foto ke-3 tidak tersedia di folder — akan tampil placeholder
    ],
    latitude: -7.9724, // TODO: verifikasi koordinat
    longitude: 112.6316, // TODO: verifikasi koordinat
    desc:
        'Soto Ayam Lombok is one of the most legendary culinary landmarks in Malang, serving patrons since 1955. Contrary to what its name might suggest, the dish is neither fiery spicy nor from Lombok Island; rather, the name derives from the location of its very first stall on Jalan Lombok No. 1, Kasin, Klojen.\n\nThis Malang-style chicken soto features a distinctive golden broth that is rich, savory, and aromatic with herbs and spices. It is crowned with roasted spiced coconut powder (koya kelapa)—a signature Malang touch distinct from the prawn cracker koya found in Lamongan-style soto. Prepared with tender free-range indigenous chicken (ayam kampung), the soto is served with boiled potato slices, hard-boiled eggs, bean sprouts, finely shredded cabbage, and a generous basket of crackers.',
  ),

  // ────────────────────────── EROPA ──────────────────────────
  const FoodCulinaryDto(
    id: 11,
    slug: 'toko-oen',
    name: 'Toko Oen',
    culture: CulinaryCulture.eropa,
    yearEstablished: '1930',
    address: 'Jl. Jenderal Basuki Rahmat, Kota Malang',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Toko+Oen+Malang',
    imageUrls: [
      'assets/images/culinary_extracted/Toko_oen1.PNG',
      'assets/images/culinary_extracted/Toko_oen2.PNG',
      'assets/images/culinary_extracted/Toko_oen3.PNG',
    ],
    latitude: -7.9757, // TODO: verifikasi koordinat
    longitude: 112.6336, // TODO: verifikasi koordinat
    desc:
        'Toko Oen is one of the premier culinary icons and historical landmarks in Malang. Established in 1930 by the Oen family, the restaurant continues to preserve the distinctive Dutch colonial ambiance that defined its inception. Located on Jalan Jenderal Basuki Rahmat, Toko Oen has stood as a witness to Malang\'s evolution from colonial days to the modern era. The architectural authenticity, spacious salon layout, and vintage rattan and wood furnishings remain intact, transporting guests back to an era rarely experienced today.\n\nThe allure of Toko Oen stems not only from its storied past, but also from its fidelity to classic recipes honed over decades. An eclectic menu of homemade ice cream, Dutch-style beef steaks (bistik), Indonesian fried rice, and European pastries is prepared with enduring consistency. The artisanal ice cream is the restaurant\'s most iconic offering, crafted following heirloom recipes handed down across generations and serving as a major magnet for travelers.\n\nAs one of Malang\'s oldest dining establishments, Toko Oen embodies the cultural acculturation of the colonial period. Continental European culinary traditions seamlessly mingle with Indonesian archipelago dishes, curating a unique Indisch dining heritage. This harmonious blend illustrates how gastronomic culture blossomed through the daily interactions of diverse communities residing in colonial Malang.\n\nDining at Toko Oen is far more than a meal; it is an immersive historical journey. High ceilings, large vintage windows, classic furnishings, and antique memorabilia evoke the nostalgia of early 20th-century Malang. It is no wonder that the establishment remains a cherished retreat for international travelers, history buffs, and photography enthusiasts alike.\n\nToday, Toko Oen steadfastly preserves its identity as a living museum of classic cuisine and colonial heritage. Its enduring presence demonstrates that dining is not merely about sustenance, but a treasured medium for conserving the history, architecture, and cultural soul of Malang.',
  ),
  const FoodCulinaryDto(
    id: 12,
    slug: 'the-cornelias-yulias-kitchen',
    name: "The Cornelia's Authentic Family Cuisine (Yulia's Kitchen)",
    culture: CulinaryCulture.eropa,
    yearEstablished: '1992',
    address: 'Jl. Bukit Dieng Permai, Pisang Candi, Kec. Sukun, Kota Malang, Jawa Timur 65146',
    mapsUrl: 'https://maps.app.goo.gl/6mYz1MLw3LuJ9TPE8',
    imageUrls: [
      'assets/images/culinary_extracted/The_corn1.PNG',
      'assets/images/culinary_extracted/The_corn2.PNG',
      'assets/images/culinary_extracted/The_corn3.PNG',
    ],
    latitude: -7.9988, // TODO: verifikasi koordinat
    longitude: 112.6049, // TODO: verifikasi koordinat
    desc:
        'This restaurant is celebrated for two legendary culinary treasures rooted in European cross-cultural fusion: pastel tutup and ayam kodok. Pastel tutup draws direct inspiration from the British and Western European Shepherd\'s Pie or Cottage Pie, traditionally featuring minced meat sealed beneath a golden blanket of mashed potatoes. The name "Pastel Tutup" literally refers to the smooth potato crust that completely seals the filling below. Here, the traditional minced lamb or beef is replaced with an inventive local filling: shredded chicken, glass noodles (a Chinese culinary influence), wood ear mushrooms, diced carrots, and hard-boiled eggs. The top potato layer is brushed with egg yolk and baked to a glistening golden brown, delivering a savory, rich, and comforting flavor.\n\nMeanwhile, "Ayam Kodok" (literally "frog chicken") takes its whimsical name from a local metaphor, as the deboned, flattened whole chicken resembles a crouching frog. This dish is adapted from the French Galantine culinary technique—a grand banquet dish requiring master knife skills to completely debone a whole chicken without tearing its skin. The intact chicken skin is stuffed with a rich farce of minced chicken and beef, milk-soaked bread, aromatic spices, and whole hard-boiled eggs nestled in the center. The stuffed bird is gently steamed and then roasted with a glaze of butter and sweet soy sauce. In Malang, this masterpiece is a quintessential festive centerpiece (feestelijk) for grand family celebrations.',
  ),

  // ────────────────────────── CINA ──────────────────────────
  const FoodCulinaryDto(
    id: 13,
    slug: 'depot-han-tjwan-sing',
    name: 'Depot Han Tjwan Sing',
    culture: CulinaryCulture.cina,
    yearEstablished: '1927',
    address: 'Jl. DR. Wahidin No. 123, Krajan, Kalirejo, Kec. Lawang, Kabupaten Malang',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Depot+Han+Tjwan+Sing+Lawang',
    imageUrls: [
      'assets/images/culinary_extracted/Depot_han1.PNG',
      'assets/images/culinary_extracted/Depot_han2.PNG',
      'assets/images/culinary_extracted/Depot_han3.PNG',
    ],
    latitude: -7.8631, // TODO: verifikasi koordinat (Lawang, Kab. Malang)
    longitude: 112.6949, // TODO: verifikasi koordinat
    desc:
        'Depot Han Tjwan Sing, widely known as Depot HTS, is a legendary dining establishment in Lawang, Malang Regency, established in 1927. The depot was founded by Han Tjwan Sing, who stepped down from his job in Pasuruan to start a modest home business with his wife, selling herbal tonics (jamu) and homemade pastries. Thanks to the extraordinary taste of their onde-onde (sesame seed balls), the venture expanded rapidly and set up a stall in front of Lawang Market. During the Dutch colonial era, HTS onde-onde became a favorite treat, particularly among Dutch travelers journeying along the Surabaya–Malang corridor. Since 1988, the restaurant has occupied a spacious premises on Jalan Dr. Wahidin No. 123, Lawang, and is now overseen by the founder\'s third generation.\n\nThe distinction of Depot HTS lies in its steadfast adherence to family recipes for nearly a century. While today it operates as a full-fledged restaurant serving East Javanese classics such as rawon merah (red-spiced beef soup), rawon hitam (traditional black rawon), sop merah (Indo-Dutch tomato soup), braised ox tongue semur, and beef rib rice, its primary identity remains inextricably linked to its legendary onde-onde. HTS onde-onde features a delicate, tender crust generously coated in sesame seeds, filled with sweet mung bean, red bean, or spiced shredded coconut. This culinary consistency keeps loyal patrons returning across generations, including Dutch descendants visiting Indonesia on nostalgic journeys.\n\nDepot Han Tjwan Sing reflects the long gastronomic evolution of Greater Malang. From a humble cottage industry, it has matured into a heritage culinary destination embodying family perseverance, craftsmanship, and continuity. The seamless fusion of traditional Chinese pastries like onde-onde with East Javanese homestyle cooking illustrates how cultural acculturation developed naturally during the colonial era.\n\nA visit to Depot HTS offers the charm of vintage dining within an ambiance that retains classic nostalgia. Its expansive hall along the main Surabaya–Malang highway makes it a beloved rest stop for travelers. In addition to savoring a warm bowl of signature rawon merah, visitors rarely leave without taking home boxes of warm onde-onde as gifts. The blend of authentic heritage recipes, century-old history, and multi-generational dedication cements Depot Han Tjwan Sing as a timeless icon of Greater Malang\'s culinary landscape.',
  ),
  const FoodCulinaryDto(
    id: 14,
    slug: 'depot-hok-lay',
    name: 'Depot Hok Lay',
    culture: CulinaryCulture.cina,
    yearEstablished: '1946',
    address: 'Jl. KH. Ahmad Dahlan No. 10, Klojen, Kota Malang',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Depot+Hok+Lay+Malang',
    imageUrls: [
      'assets/images/culinary_extracted/Depot_hok1.PNG',
      'assets/images/culinary_extracted/Depot_hok2.PNG',
      'assets/images/culinary_extracted/Depot_hok3.PNG',
    ],
    latitude: -7.9768, // TODO: verifikasi koordinat
    longitude: 112.6301, // TODO: verifikasi koordinat
    desc:
        'Depot Hok Lay is a premier culinary icon in Malang, welcoming guests since 1946. Founded by a Chinese-Indonesian family and situated on Jalan KH Ahmad Dahlan No. 10, Klojen, the depot preserves its colonial-era facade and vintage interior. The name "Hok Lay" originates from the Hokkien word meaning fortune or blessings, reflecting the founder\'s wish for prosperous fortune for the family. For nearly eight decades, Depot Hok Lay has remained a beloved culinary landmark for locals and travelers alike through its unwavering commitment to taste, ambiance, and heirloom recipes.\n\nThe magic of Depot Hok Lay lies in the delicate fusion of Chinese culinary roots with local Malang sensibilities. Its most acclaimed dish is Pangsit Cwie Mie—delicate, springy noodles tossed with savory seasoned minced chicken and served with crisp wontons and a bowl of clear, rich broth. Another standout is Lumpia Semarang, featuring a crispy golden wrapper packed with seasoned bamboo shoots and minced meat. Depot Hok Lay is equally famous for its legendary beverage Fosco, a velvety blend of fresh milk and chocolate syrup chilled and served in retro glass soda bottles—a nostalgic tradition preserved since the beginning that has become a defining trademark of the depot.\n\nDepot Hok Lay stands as a living embodiment of cultural acculturation in Malang. Traditional Chinese recipes merged seamlessly with local Javanese tastes, giving birth to dishes that define Malang\'s culinary identity today. Beyond the food, the vintage wooden booth seating, antique patterned floor tiles, and unhurried charm transport guests straight to the mid-20th century. This authenticity elevates Depot Hok Lay from a mere restaurant to an essential part of Malang\'s cultural and historical fabric.\n\nA visit to Depot Hok Lay offers an enchanting journey into vintage culinary nostalgia. Guests can bask in the warm, cozy atmosphere of a heritage family diner while enjoying a bowl of Cwie Mie, piping-hot Lumpia Semarang, and an ice-cold bottle of Fosco. Even in the beating heart of downtown Malang, the eatery retains its tranquil simplicity, offering a refreshing respite from modern restaurant trends. To this day, Depot Hok Lay remains an unmissable destination for anyone seeking to discover the history, culture, and gastronomic richness of Malang.',
  ),
  const FoodCulinaryDto(
    id: 15,
    slug: 'ronde-titoni-1948',
    name: 'Ronde Titoni 1948',
    culture: CulinaryCulture.cina,
    yearEstablished: '1948',
    address: 'Jl. Zainul Arifin, Kota Malang',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Ronde+Titoni+Malang',
    imageUrls: [
      'assets/images/culinary_extracted/Ronde_titoni1.PNG',
      'assets/images/culinary_extracted/Ronde_titoni2.PNG',
      'assets/images/culinary_extracted/Ronde_titoni3.PNG',
    ],
    latitude: -7.9768, // TODO: verifikasi koordinat
    longitude: 112.6283, // TODO: verifikasi koordinat
    desc:
        'Ronde Titoni is one of the most legendary nighttime culinary landmarks in Malang, warming visitors since 1948. The stall was founded by Abdul Hadi, who initially peddled wedang ronde and angsle using a shoulder pole basket (pikulan) around the Pasar Besar Malang market. At night, he regularly set up station in front of the Titoni Watch Store, prompting patrons to refer to his fare as "Ronde Titoni." That fond nickname stuck and became an enduring brand celebrated by locals and tourists alike. By the 1970s, operations transitioned to a pushcart before finally settling into its permanent home on Jalan Zainul Arifin in 1988. Managed today by descendants of the founder, Ronde Titoni proudly honors recipes preserved for more than seven decades.\n\nThe secret to Ronde Titoni\'s timeless appeal lies in the authentic taste of its wedang ronde crafted according to ancestral methods. A steaming bowl of ronde features aromatic, spicy-sweet ginger broth poured over soft glutinous rice balls filled with sweet, crushed peanuts. In addition to ronde, the shop is equally famous for angsle, a comforting warm coconut milk soup ladled over bread cubes, mung beans, steamed rice flour noodles (petulo), tapioca pearls, and roasted peanuts. Complemented by dry ronde, sweet peanut broth (kacang kuah), cakwe (fried crullers), and fried sesame bread, it provides the ultimate late-night comfort.\n\nRonde Titoni offers more than soothing warmth; it represents decades of cultural acculturation between Chinese and Javanese culinary traditions. Wedang ronde traces its origins to the Chinese winter solstice tradition of tangyuan, which in Indonesia evolved by adopting a robust, warming ginger broth ideally suited to the cool mountain climate of Malang and local tastes. Upholding these authentic recipes and unpretentious service turns Ronde Titoni into a treasured cultural and historical gem.\n\nVisiting Ronde Titoni is an indispensable nighttime ritual when exploring Malang. Every evening, the parlor fills with a diverse cross-section of patrons—from college students and longtime residents to out-of-town travelers looking to escape the crisp mountain chill with a comforting bowl of ronde or angsle. The cozy atmosphere, enticing scent of fresh ginger, and recipes perfected since 1948 make Ronde Titoni an emotional centerpiece of Malang\'s gastronomic heritage.',
  ),
  const FoodCulinaryDto(
    id: 16,
    slug: 'depot-pangsit-mie-bromo-pojok',
    name: 'Depot Pangsit Mie Bromo Pojok',
    culture: CulinaryCulture.cina,
    yearEstablished: '1984',
    address: 'Jl. Pattimura No. 53, Klojen, Kota Malang',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Pangsit+Mie+Bromo+Pojok+Malang',
    imageUrls: [
      'assets/images/culinary_extracted/Depot_pangsit1.PNG',
      'assets/images/culinary_extracted/Depot_pangsit2.PNG',
      'assets/images/culinary_extracted/Depot_pangsit3.PNG',
    ],
    latitude: -7.9787, // TODO: verifikasi koordinat
    longitude: 112.6266, // TODO: verifikasi koordinat
    desc:
        'Depot Pangsit Mie Bromo Pojok is one of Malang\'s legendary noodle havens, serving food lovers since 1984. The eatery originally operated on a street corner along Jalan Bromo, earning it the affectionate moniker "Bromo Pojok" (Bromo Corner). Even after relocating in the early 1990s to Jalan Pattimura No. 53, the beloved name was kept as an indelible identity. Thanks to unwavering flavor consistency and a steadily expanding following, Depot Pangsit Mie Bromo Pojok has grown into a favorite culinary institution in Malang with multiple branches across the city.\n\nThe signature hallmark of Depot Pangsit Mie Bromo Pojok is its Malang-style cwie mie made with fresh, homemade noodles crafted daily on-site, delivering an impeccably springy, tender texture. A bowl of cwie mie comes topped with finely seasoned minced chicken, fresh lettuce, crisp golden wonton crisps, and a bowl of clear, savory broth. Alongside classic noodle offerings, the depot innovates with inventive toppings such as black pepper chicken, spicy shrimp, sautéed mushrooms, shredded cheese, and steamed siomay, catering to diverse modern palates while honoring decades of tradition. Another staple favorite among regulars is their refreshing es campur (shaved ice dessert), the perfect sweet counterpart to a hot bowl of noodles.\n\nDepot Pangsit Mie Bromo Pojok exemplifies how Chinese-Javanese culinary acculturation became a defining pillar of Malang\'s gastronomic identity. Cwie mie evolved from Chinese wheat noodle traditions, adapted over decades with local flavors that distinguish it from noodle dishes elsewhere in Indonesia. In-house noodle making, premium fresh ingredients, and dedication to family recipes have kept this diner relevant across multiple generations, making it an essential reference point for Malang cuisine.\n\nA visit to Depot Pangsit Mie Bromo Pojok offers an authentic encounter with one of Malang\'s most iconic dishes. The unpretentious, classic diner interior evokes fond memories of longstanding family restaurants that have stood the test of time. To this day, the flagship location on Jalan Pattimura No. 53 remains bustling with locals and out-of-town food enthusiasts eager to taste genuine Malang cwie mie. Its rich heritage, outstanding flavor quality, and steadfast hospitality make Depot Pangsit Mie Bromo Pojok a must-visit destination in Malang.',
  ),
  const FoodCulinaryDto(
    id: 17,
    slug: 'bakso-president',
    name: 'Bakso President',
    culture: CulinaryCulture.cina,
    yearEstablished: '1977',
    address: 'Jl. Batanghari No. 5, Kota Malang',
    mapsUrl: 'https://www.google.com/maps/search/?api=1&query=Bakso+President+Malang',
    imageUrls: [
      'assets/images/culinary_extracted/Bakso_president1.PNG',
      'assets/images/culinary_extracted/Bakso_president2.PNG',
      'assets/images/culinary_extracted/Bakso_president3.PNG',
    ],
    latitude: -7.9624,
    longitude: 112.6367,
    desc:
        'Bakso President is a legendary culinary institution that has served as an emblem of Malang since its inception in 1977. Located on Jalan Batanghari No. 5, this meatball house offers an experience virtually impossible to replicate elsewhere: it sits directly alongside an active train track. Whenever a train rumbles past just inches away, diners experience an exhilarating and unforgettable meal, making Bakso President famous not only for its mouthwatering meatballs, but also for its singular, adrenaline-tinged atmosphere.\n\nThe moniker "President" was borrowed from the former President Cinema that once stood nearby. In the beginning, the owner peddled meatballs from a modest pushcart around the theater. As word of mouth spread and crowds grew, the venture expanded into a permanent dining hall that is now considered a mandatory pilgrimage for travelers visiting Malang.\n\nBakso President is acclaimed for its vast variety of accompaniments, including smooth beef meatballs (bakso halus), textured tendon meatballs (bakso urat), crispy fried meatballs (bakso goreng), sweet-glazed grilled meatballs (bakso bakar), steamed siomay, stuffed tofu, and various offal cuts tailored to each diner\'s liking. The piping-hot, aromatic bone broth paired with springy meatballs has remained a hallmark since 1977. In particular, their grilled meatballs brushed in sweet-savory spices have become an iconic culinary trend synonymous with Malang.\n\nThe enduring legacy of Bakso President illustrates how humble street food can become intertwined with a city\'s cultural identity. Beyond offering dependable, mouthwatering flavor for decades, it preserves historical memories that parallel Malang\'s urban evolution. Dining right by the tracks creates an irreplaceable, photogenic thrill etched into the memories of every visitor.\n\nToday, Bakso President remains among the most frequented culinary hotspots in Malang. The combination of authentic flavors, storied heritage, and the thrilling sensation of dining by the railway tracks establishes Bakso President as a true gastronomic icon that enriches the tourism appeal of Malang.',
  ),
  const FoodCulinaryDto(
    id: 18,
    slug: 'depot-mie-gadjah-mada',
    name: 'Depot Mie Gadjah Mada',
    culture: CulinaryCulture.cina,
    yearEstablished: '1950-an',
    address: 'Jl. Pasar Besar No.17 A, Sukoharjo, Kec. Klojen, Kota Malang, Jawa Timur 65118',
    mapsUrl: 'https://maps.app.goo.gl/euHpxCLEHHeL8K3h8',
    imageUrls: [
      'assets/images/culinary_extracted/Depot_mie1.PNG',
      'assets/images/culinary_extracted/Depot_mie2.PNG',
      'assets/images/culinary_extracted/Depot_mie3.PNG',
    ],
    latitude: -7.9762, // TODO: verifikasi koordinat
    longitude: 112.6335, // TODO: verifikasi koordinat
    desc:
        'Depot Mie Gadjah Mada 1 is among the most celebrated legendary noodle destinations in Malang. Founded in the 1950s, this dining haven is renowned for serving authentic Malang-style wonton noodles (cwie mie) crafted with springy, preservative-free homemade noodles produced fresh daily.\n\nDepot Mie Gadjah Mada offers a well-curated menu ranging from Rp25,000 to Rp65,000, delivering outstanding value for generous portions and exceptional quality:\n\n- Pangsit Mie Ayam Jamur: the classic signature noodle topped with braised chicken and savory mushrooms, serving as the benchmark for this legendary diner.\n\n- Pangsit Mie Istimewa: the ultimate bowl for diners who want it all, served complete with steamed siomay, meatballs, and tender chicken offal.\n\n- Mie Kocok Gadjah Mada: shaken noodles served in a rich, velvety broth seasoned with bold, aromatic spices.\n\n- Fosco (legendary beverage): a retro chocolate-milk drink served chilled in vintage Coca-Cola glass bottles, offering a distinctive sweet, savory, and velvety creamy flavor profile.',
  ),
];
