import 'package:latlong2/latlong.dart';
import 'package:oldcityguideapp/core/common/domain/dto/gegraphy_dto.dart';

final List<GeographyDto> geographyMockData = [
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
];
