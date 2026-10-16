import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';

/// Geography data per locale: 'id' and 'en'
final Map<String, List<GeographyDto>> geographyMockDataByLocale = {
  'id': [
    GeographyDto(
      id: 1,
      name: 'Lasem',
      title: 'Letak Lasem',
      desc: 'Lasem adalah sebuah kecamatan di Kabupaten Rembang, Provinsi Jawa Tengah, Indonesia. '
          'Kota ini terletak di pesisir utara Pulau Jawa, sekitar 12 km sebelah timur Rembang. '
          'Lasem dikenal sebagai salah satu kota tua bersejarah di Jawa, dengan julukan "Tiongkok Kecil" '
          'karena kekayaan warisan budaya Tionghoa-Jawa yang masih terjaga hingga kini. '
          'Kota ini memiliki banyak klenteng kuno, rumah pecinan bergaya arsitektur Tionghoa, '
          'serta tradisi batik Lasem yang khas dengan corak warna merah cerah. '
          'Posisi geografisnya yang berada di jalur pantura menjadikan Lasem sebagai simpul '
          'perdagangan dan akulturasi budaya yang penting sejak abad ke-14.',
      latLng: LatLng(-6.7039, 111.4622),
      imageAsset: 'assets/images/geography/lasem.png',
      markerTitle: 'Kota Lasem',
      transportationGuides: [],
    ),
    GeographyDto(
      id: 2,
      name: 'Malang',
      title: 'Letak Malang',
      desc: 'Malang terletak di bagian tengah-selatan Provinsi Jawa Timur. Dalam pengertian kewilayahan, '
          'Malang Raya meliputi Kota Malang, Kota Batu, dan Kabupaten Malang. Kawasan ini berada di '
          'dataran tinggi dan cekungan yang dikelilingi pegunungan sehingga memiliki suhu relatif sejuk '
          'dan tanah yang subur.\n\n'
          'Posisi Malang di antara daerah pedalaman yang subur dan jalur menuju pesisir menjadikannya '
          'tidak terisolasi. Malang menjadi tempat pertemuan penduduk lokal dengan berbagai jaringan '
          'politik, ekonomi, agama, dan kebudayaan dari wilayah Nusantara maupun dunia luar. '
          'Karena itu, letak geografis Malang turut membentuk karakternya sebagai ruang persilangan budaya.\n\n'
          'Bentang alam Malang dibentuk oleh sejumlah pegunungan dan gunung api, antara lain '
          'Gunung Arjuno-Welirang di utara, Gunung Kawi dan Butak di barat, serta kawasan '
          'Semeru-Tengger di timur. Bagian selatan Kabupaten Malang berbatasan langsung dengan '
          'Samudra Hindia dan memiliki bentang pantai, perbukitan kapur, serta kawasan karst.\n\n'
          'Wilayah ini juga dilalui Sungai Brantas beserta anak-anak sungainya. Sejak masa kerajaan, '
          'sungai tersebut berperan penting dalam mendukung pertanian, permukiman, dan hubungan '
          'antara wilayah pedalaman dengan pesisir.',
      latLng: LatLng(-7.966620, 112.632632),
      imageAsset: 'assets/images/geography/malang.png',
      markerTitle: 'Ibu Kota Malang',
      transportationGuides: [],
    ),
  ],
  'en': [
    GeographyDto(
      id: 1,
      name: 'Lasem',
      title: 'Location of Lasem',
      desc: 'Lasem is a sub-district in Rembang Regency, Central Java Province, Indonesia. '
          'It is located on the northern coast of Java Island, approximately 12 km east of Rembang. '
          'Lasem is known as one of the historic old cities in Java, nicknamed "Little China" '
          'due to its rich Chinese-Javanese cultural heritage that has been preserved to this day. '
          'The city has many ancient temples, Chinatown houses with Chinese architectural styles, '
          'as well as the distinctive Lasem batik tradition with its characteristic bright red patterns. '
          'Its geographical position along the northern coast route made Lasem an important hub '
          'for trade and cultural acculturation since the 14th century.',
      latLng: LatLng(-6.7039, 111.4622),
      imageAsset: 'assets/images/geography/lasem.png',
      markerTitle: 'Lasem City',
      transportationGuides: [],
    ),
    GeographyDto(
      id: 2,
      name: 'Malang',
      title: 'Location of Malang',
      desc: 'Malang is located in the south-central part of East Java Province. In terms of territory, '
          'Greater Malang encompasses Malang City, Batu City, and Malang Regency. This area is situated '
          'on highlands and basins surrounded by mountains, resulting in a relatively cool climate '
          'and fertile soil.\n\n'
          'Malang\'s position between the fertile hinterland and routes to the coast made it '
          'far from isolated. Malang became a meeting point for local residents with various '
          'political, economic, religious, and cultural networks from across the Archipelago and beyond. '
          'Therefore, Malang\'s geographical location helped shape its character as a crossroads of cultures.\n\n'
          'Malang\'s landscape is formed by several mountain ranges and volcanoes, including '
          'Mount Arjuno-Welirang to the north, Mount Kawi and Butak to the west, and the '
          'Semeru-Tengger area to the east. The southern part of Malang Regency directly borders '
          'the Indian Ocean and features coastal stretches, limestone hills, and karst areas.\n\n'
          'This region is also traversed by the Brantas River and its tributaries. Since the era of kingdoms, '
          'the river has played an important role in supporting agriculture, settlements, and connections '
          'between the hinterland and the coast.',
      latLng: LatLng(-7.966620, 112.632632),
      imageAsset: 'assets/images/geography/malang.png',
      markerTitle: 'Malang City',
      transportationGuides: [],
    ),
  ],
};

/// Backward compatibility — default to Indonesian
final List<GeographyDto> geographyMockData = geographyMockDataByLocale['id']!;
