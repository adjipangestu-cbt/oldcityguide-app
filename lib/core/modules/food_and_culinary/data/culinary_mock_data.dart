import 'package:oldcityguideapp/core/modules/food_and_culinary/domain/dto/food_culinary_dto.dart';

/// Pengantar tiap kategori kultur
const Map<CulinaryCulture, ({String judul, String pengantar})>
    culinaryCultureIntro = {
  CulinaryCulture.arab: (
    judul: 'Wisata Kuliner Arab',
    pengantar:
        'Komunitas Arab, khususnya keturunan Hadrami dari Yaman, mulai menetap di berbagai kota di Indonesia sejak abad ke-19, termasuk di Kota Malang. Kedatangan mereka tidak hanya berkaitan dengan perdagangan, tetapi juga penyebaran agama Islam serta pembentukan jaringan sosial dan ekonomi.\n\nSeiring waktu, masyarakat Arab berinteraksi dengan masyarakat Jawa sehingga melahirkan berbagai bentuk akulturasi budaya, termasuk dalam bidang kuliner. Berbagai makanan Timur Tengah mengalami penyesuaian terhadap bahan baku lokal, teknik memasak, serta preferensi rasa masyarakat Indonesia.\n\nDalam kajian hybrid culture, kuliner Arab di Indonesia tidak lagi dipandang sebagai makanan Timur Tengah yang "murni", melainkan sebagai hasil perpaduan budaya Arab dan Nusantara.',
  ),
  CulinaryCulture.jawa: (
    judul: 'Wisata Kuliner Jawa',
    pengantar:
        'Kuliner tradisional Jawa di Malang telah berkembang menjadi bagian penting dari kehidupan masyarakat saat ini. Berawal dari tradisi agraris yang memanfaatkan hasil bumi dan rempah-rempah lokal, masyarakat Malang menciptakan beragam hidangan yang sederhana namun kaya cita rasa. Memasuki masa kolonial, perkembangan perdagangan dan pertumbuhan kota turut memperkaya khazanah kuliner lokal tanpa menghilangkan karakter khas masakan Jawa yang diwariskan secara turun-temurun.\n\nHingga kini, berbagai rumah makan dan warung legendaris masih mempertahankan resep asli yang telah bertahan selama puluhan bahkan lebih dari satu abad. Kuliner seperti rawon, pecel, sate gebug, bakso, hingga aneka jajanan tradisional menjadi saksi perjalanan sejarah Kota Malang sekaligus mencerminkan nilai kebersamaan, keramahan, dan kearifan lokal masyarakatnya.',
  ),
  CulinaryCulture.eropa: (
    judul: 'Wisata Kuliner Eropa',
    pengantar:
        'Perkembangan kuliner Eropa di Kota Malang tidak dapat dipisahkan dari sejarah kolonial Belanda pada akhir abad ke-19 hingga pertengahan abad ke-20. Pada masa tersebut, Malang berkembang sebagai kota perkebunan dan kota peristirahatan (hill station) bagi orang-orang Eropa karena iklimnya yang sejuk.\n\nBersamaan dengan berkembangnya kawasan permukiman kolonial, muncul berbagai restoran, toko roti, kedai kopi, dan rumah makan bergaya Eropa yang melayani masyarakat Belanda, Tionghoa, maupun kalangan elite pribumi.\n\nMeskipun masa kolonial telah berakhir, beberapa bangunan beserta tradisi kulinernya masih bertahan hingga sekarang. Salah satu contoh terbaik adalah Toko Oen, yang tidak hanya mempertahankan resep klasik, tetapi juga mempertahankan arsitektur dan atmosfer kolonial sebagai bagian dari daya tarik wisatanya.',
  ),
  CulinaryCulture.cina: (
    judul: 'Wisata Kuliner Cina',
    pengantar:
        'Komunitas Cina mulai berkembang di Kota Malang sejak abad ke-19, terutama setelah pemerintah kolonial Belanda membuka berbagai perkebunan kopi, tebu, dan tembakau di wilayah Malang. Kehadiran komunitas ini tidak hanya berkontribusi pada sektor perdagangan, tetapi juga memperkaya budaya kuliner kota.\n\nDi kawasan pusat kota, terutama sekitar Pasar Besar, Kayutangan, dan Pecinan Malang, tumbuh berbagai rumah makan yang menyajikan hidangan berbasis mi, pangsit, bakso, lumpia, hingga minuman tradisional. Seiring waktu, makanan tersebut mengalami adaptasi agar sesuai dengan mayoritas masyarakat Muslim, misalnya dengan mengganti daging babi menjadi ayam atau sapi, serta menyesuaikan penggunaan bumbu.\n\nProses adaptasi ini melahirkan kuliner Peranakan, yaitu kuliner hasil perpaduan tradisi Tionghoa dengan budaya lokal Jawa. Oleh karena itu, banyak makanan khas Malang saat ini tidak lagi dapat dikategorikan sebagai "murni Tionghoa", melainkan sebagai hasil hybrid culture yang telah menjadi bagian dari identitas Kota Malang.',
  ),
};

final List<FoodCulinaryDto> culinaryMockData = [
  // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€ ARAB â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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
        'Lumpur Arab Legenda merupakan salah satu kuliner legendaris Kota Malang yang telah dikenal sejak tahun 1960. Usaha keluarga ini bermula dari resep turun-temurun milik keluarga keturunan Arab-Yaman yang kemudian dikembangkan menjadi salah satu ikon oleh-oleh khas Malang. Hingga kini, Lumpur Arab Legenda tetap mempertahankan cita rasa autentik yang diwariskan dari generasi ke generasi. Saat ini, toko tersebut memiliki gerai di Jalan Kauman No. 9A dan Jalan Soekarno Hatta No. 32, sehingga semakin mudah dijangkau oleh masyarakat maupun wisatawan.\n\nKeistimewaan Lumpur Arab Legenda terletak pada konsistensinya mempertahankan resep tradisional selama lebih dari enam dekade. Kue lumpur dibuat menggunakan bahan-bahan sederhana seperti kentang, santan, telur, mentega, dan tepung terigu sehingga menghasilkan tekstur yang lembut, padat, dan harum. Ciri khasnya adalah taburan kismis di bagian atas yang memberikan sentuhan rasa manis sekaligus menjadi identitas visual yang mudah dikenali. Seiring perkembangan zaman, selain varian original, tersedia pula berbagai pilihan rasa modern seperti keju, cokelat, pandan, dan aneka topping lainnya tanpa menghilangkan karakter utama kue lumpur tradisional.\n\nNama "Lumpur Arab" mencerminkan latar belakang keluarga pendirinya yang berasal dari komunitas Arab di Kota Malang. Kehadiran kuliner ini menjadi salah satu bukti akulturasi budaya Arab dan Indonesia yang telah berlangsung sejak lama. Meskipun menggunakan resep keluarga keturunan Arab, bahan baku dan cita rasanya disesuaikan dengan selera masyarakat lokal sehingga melahirkan jajanan yang diterima oleh berbagai kalangan. Hal tersebut menunjukkan bahwa interaksi budaya tidak hanya tercermin melalui bahasa atau tradisi, tetapi juga melalui warisan kuliner yang terus berkembang.\n\nBerkunjung ke Lumpur Arab Legenda memberikan pengalaman menikmati jajanan tradisional yang tetap relevan di tengah maraknya makanan modern. Kue lumpur yang baru matang memiliki aroma mentega dan santan yang khas, dengan tekstur lembut yang lumer di mulut. Banyak wisatawan memilih membelinya sebagai oleh-oleh karena kualitas rasa yang konsisten dan daya tahannya yang cukup baik. Selain menjadi camilan favorit masyarakat Malang, Lumpur Arab Legenda juga menjadi salah satu tujuan wisata kuliner bagi pengunjung yang ingin mencicipi jajanan klasik dengan nilai sejarah yang kuat.',
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
        'Bagi para pencinta kuliner kambing, Rumah Makan Cairo (atau yang akrab disebut Warung Sate Gule Cairo) adalah sebuah legenda hidup di Kota Malang. Berdiri sejak tahun 1953, rumah makan ini telah melewati lintas generasi dan tetap konsisten mempertahankan cita rasa khas Timur Tengah yang autentik di kawasan Embong Arab. Keunggulan utama yang membuat tempat ini selalu ramai adalah keahliannya dalam mengolah daging kambing menjadi sangat empuk, gurih, dan sama sekali tidak berbau prengus.\n\nJika Anda tertarik untuk mencicipinya, pusat kuliner legendaris ini berlokasi di Jl. Kapten Piere Tendean No. 1, Klojen, Kota Malang. Warung ini siap menyambut pelanggan setiap hari dari pukul 08.00 hingga 22.00 WIB, khusus untuk hari Jumat, pintu baru dibuka mulai pukul 13.00 WIB setelah ibadah Shalat Jumat. Selain di Malang, mereka juga telah melebarkan sayap dengan membuka cabang di Jl. Panglima Sudirman No. 62, Kota Batu, memudahkan wisatawan yang sedang berlibur di sana untuk ikut menikmati hidangan mereka.\n\nSaat berkunjung, menu yang wajib Anda coba adalah Sate Kambing Tanpa Lemak yang disajikan dengan potongan daging besar dan empuk, dengan kisaran harga sekitar Rp40.000 per porsi isi 10 tusuk. Selain sate, hidangan primadona lainnya adalah Gule Kambing seharga Rp35.000 hingga Rp49.000 yang terkenal dengan kuah kuningnya yang kaya rempah namun terasa ringan dan tidak membuat enek. Anda juga bisa melengkapi santapan dengan Nasi Kebuli yang harum atau Roti Maryam sebagai hidangan penutup dengan kisaran harga menu utama berkisar antara Rp40.000 hingga Rp50.000.\n\nSatu tips penting jika Anda berencana datang ke cabang pusat di Kota Malang menggunakan mobil: area parkir di depan warung ini terbilang cukup terbatas dan hanya muat untuk 1 hingga 2 kendaraan. Oleh karena itu, datang lebih awal di luar jam makan malam atau memanfaatkan transportasi online akan membuat pengalaman kulineran Anda menjadi jauh lebih nyaman dan praktis.',
  ),

  // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€ JAWA â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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
        'Warung Bu Muslikah sudah lama dikenal sebagai ikon nasi jagung di Malang. Terletak di kawasan Karangbesuki, dekat kampus dan kos-kosan mahasiswa, tempat ini selalu ramai setiap pagi. Sepiring nasi jagung hangat disajikan dengan lauk sederhana seperti sayur lodeh, ikan asin, tempe goreng, dan sambal terasi pedas yang khas.\n\nDengan harga yang ramah di kantong dan rasa yang otentik, Bu Muslikah mempertahankan cita rasa tradisional Jawa Timur yang gurih dan menenangkan. Buka sejak pukul 08.30 pagi sampai 12 siang, banyak pelanggan datang bukan hanya untuk makan, tetapi juga untuk bernostalgia dengan suasana rumah desa yang hangat. Sejak pagi, pengunjung sudah mulai memadati tempat ini demi menikmati sepiring nasi jagung dengan lauk urap, mendol, dan ikan asin. Dengan harga sekitar Rp12.000, seporsi nasi jagung di sini tak hanya mengenyangkan, tetapi juga membawa sensasi cita rasa tradisional yang otentik.',
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
        'Pos Ketan Legenda 1967 merupakan salah satu ikon wisata kuliner paling terkenal di Kota Batu, Jawa Timur. Usaha ini dirintis oleh Bu Siami pada tahun 1967 dengan menjual ketan sederhana di depan kantor pos dekat Alun-Alun Batu. Karena lokasinya yang berada di depan kantor pos, masyarakat kemudian mengenalnya dengan sebutan "Pos Ketan". Seiring berjalannya waktu, usaha tersebut diteruskan oleh putranya, Pak Sugeng, dan kini dikelola oleh generasi ketiga, Pak Supri, sehingga tetap bertahan sebagai usaha keluarga yang melegenda selama lebih dari lima dekade.\n\nKeunikan Pos Ketan Legenda 1967 terletak pada kemampuannya mengangkat makanan tradisional menjadi sajian yang tetap diminati lintas generasi. Jika pada awalnya hanya menyajikan ketan dengan kelapa parut dan bubuk kedelai, kini tersedia puluhan varian rasa, mulai dari ketan keju susu, cokelat, durian, nangka, pisang, hingga berbagai kombinasi manis dan gurih. Meski terus berinovasi mengikuti perkembangan selera masyarakat, cita rasa dasar ketan pulen yang menjadi ciri khasnya tetap dipertahankan. Inovasi inilah yang membuat Pos Ketan Legenda mampu mempertahankan eksistensinya di tengah maraknya kuliner modern.\n\nPos Ketan Legenda juga mencerminkan filosofi bahwa kuliner tradisional dapat terus hidup apabila mampu beradaptasi tanpa meninggalkan identitasnya. Ketan, yang sejak dahulu menjadi makanan tradisional masyarakat Jawa, diolah menjadi berbagai kreasi baru sehingga tetap relevan bagi generasi muda. Perpaduan antara resep tradisional dan inovasi menu menjadikan tempat ini sebagai contoh bagaimana warisan kuliner lokal dapat berkembang mengikuti perubahan zaman tanpa kehilangan akar budayanya.\n\nBerkunjung ke Pos Ketan Legenda memberikan pengalaman kuliner yang khas, terutama pada malam hari ketika kawasan Alun-Alun Batu dipenuhi wisatawan. Pengunjung dapat menikmati seporsi ketan hangat dengan aneka pilihan topping sambil merasakan suasana kota wisata yang ramai dan hidup. Antrean panjang yang hampir selalu terlihat justru menjadi bukti tingginya minat masyarakat terhadap kuliner legendaris ini. Lokasinya yang strategis di sekitar Alun-Alun Batu juga menjadikannya salah satu destinasi wajib setelah menikmati berbagai objek wisata di Kota Batu.\n\nHingga saat ini, Pos Ketan Legenda 1967 tetap menjadi salah satu simbol gastronomi Kota Batu. Keberhasilannya mempertahankan cita rasa tradisional sekaligus menghadirkan inovasi menu menjadikan tempat ini tidak hanya sebagai tujuan wisata kuliner, tetapi juga sebagai representasi bagaimana tradisi dapat terus berkembang dan diwariskan kepada generasi berikutnya. Sebagai salah satu kuliner legendaris Jawa Timur, Pos Ketan Legenda berhasil membuktikan bahwa makanan sederhana dapat tumbuh menjadi identitas daerah yang dikenal luas oleh wisatawan dari berbagai penjuru Indonesia.',
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
        'Rumah Makan Pecel Kawi Hj. Musilah merupakan salah satu kuliner legendaris yang telah menjadi ikon Kota Malang sejak tahun 1975. Didirikan oleh Hj. Musilah, warung makan ini berawal dari usaha sederhana yang menyajikan nasi pecel khas Jawa Timur dengan resep keluarga yang hingga kini tetap dipertahankan. Berlokasi di Jalan Kawi Atas No. 43B, Klojen, rumah makan ini telah berkembang menjadi salah satu destinasi kuliner favorit bagi masyarakat Malang maupun wisatawan yang ingin menikmati cita rasa pecel autentik. Usaha ini kini dikelola secara turun-temurun oleh keluarga pendirinya, sehingga kualitas rasa dan tradisi penyajiannya tetap terjaga.\n\nKeistimewaan Pecel Kawi Hj. Musilah terletak pada bumbu pecelnya yang memiliki tekstur kental dengan perpaduan rasa gurih, manis, dan sedikit pedas. Aroma khas kencur serta daun jeruk memberikan cita rasa yang berbeda dibandingkan pecel dari daerah lain. Sayuran yang digunakan selalu disajikan segar dan dipadukan dengan rempeyek renyah, tempe, serta berbagai pilihan lauk seperti telur, empal, ayam goreng, hingga sate komo. Pengunjung juga dapat menyesuaikan tingkat kepedasan bumbu sesuai selera, menjadikan setiap sajian terasa lebih personal.\n\nRumah makan ini tidak hanya mempertahankan cita rasa tradisional, tetapi juga mencerminkan kekayaan budaya kuliner Jawa Timur. Nasi pecel yang dahulu dikenal sebagai makanan sederhana masyarakat kini berkembang menjadi salah satu identitas gastronomi Kota Malang. Melalui konsistensi rasa dan penggunaan resep yang diwariskan lintas generasi, Pecel Kawi Hj. Musilah menunjukkan bahwa kuliner tradisional dapat tetap bertahan dan dicintai di tengah berkembangnya berbagai tren makanan modern. Kehadirannya menjadi bukti bahwa warisan kuliner memiliki nilai budaya yang penting untuk terus dilestarikan.\n\nBerkunjung ke Pecel Kawi Hj. Musilah memberikan pengalaman menikmati sarapan atau makan siang khas Malang dalam suasana yang hangat dan sederhana. Rumah makan ini dikenal ramai sejak pagi hari karena menjadi pilihan warga lokal maupun wisatawan. Selain menikmati seporsi nasi pecel dengan bumbu khasnya, pengunjung juga dapat merasakan suasana rumah makan legendaris yang telah menjadi bagian dari perjalanan kuliner Kota Malang selama lebih dari lima puluh tahun. Rumah Makan Pecel Kawi Hj. Musilah Asli 1975 tetap menjadi salah satu destinasi kuliner wajib bagi siapa saja yang ingin mengenal cita rasa autentik Malang sekaligus menikmati salah satu warisan gastronomi yang masih bertahan hingga saat ini.',
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
        'Warung Lama H. Ridwan merupakan salah satu warung makan tertua di Kota Malang yang telah menjadi bagian dari sejarah kuliner kota ini sejak tahun 1925. Bahkan, menurut keluarga pendiri, H. Ridwan telah mulai berjualan sejak 1919 dengan menggunakan pikulan di kawasan Pasar Besar. Tahun 1925 kemudian dipilih sebagai tahun resmi berdirinya karena bertepatan dengan dibangunnya Pasar Besar Malang dan berdirinya kios permanen yang masih ditempati hingga sekarang. Lebih dari satu abad kemudian, warung ini tetap bertahan di lokasi yang sama dan kini dikelola oleh generasi ketiga keluarga H. Ridwan.\n\nKeunikan Warung Lama H. Ridwan terletak pada kemampuannya mempertahankan cita rasa masakan rumahan khas Malang secara konsisten dari generasi ke generasi. Menu yang disajikan merupakan hidangan tradisional Jawa Timur seperti rawon, soto, gule, krengsengan, ayam goreng, serta sate komoh yang menjadi menu andalan sejak awal berdiri. Sate komoh sendiri merupakan kuliner khas Malang yang kini semakin jarang ditemukan, sehingga keberadaannya menjadi salah satu daya tarik utama bagi wisatawan maupun masyarakat lokal yang ingin menikmati cita rasa autentik Kota Malang.\n\nWarung Lama H. Ridwan tidak hanya menawarkan makanan, tetapi juga menyimpan nilai sejarah dan budaya yang kuat. Berdirinya usaha ini jauh sebelum Indonesia merdeka menunjukkan bagaimana sebuah usaha kuliner keluarga mampu bertahan melewati masa kolonial Belanda, pendudukan Jepang, hingga perkembangan Kota Malang saat ini. Resep masakan yang diwariskan secara turun-temurun tetap dipertahankan sehingga setiap hidangan masih menghadirkan cita rasa yang mengingatkan banyak pelanggan pada masakan rumah tempo dulu. Konsistensi tersebut menjadikan Warung Lama H. Ridwan sebagai salah satu representasi warisan gastronomi Kota Malang.\n\nBerkunjung ke Warung Lama H. Ridwan memberikan pengalaman kuliner yang berbeda karena lokasinya berada di lorong Pasar Besar Malang. Suasana pasar tradisional yang ramai berpadu dengan aroma masakan khas Jawa Timur menciptakan nuansa nostalgia yang sulit ditemukan di restoran modern. Banyak pelanggan yang telah menjadi langganan selama puluhan tahun dan kembali mengajak keluarga mereka untuk menikmati hidangan di tempat yang sama. Pengalaman tersebut menjadikan Warung Lama H. Ridwan bukan sekadar tempat makan, tetapi juga ruang yang menyimpan kenangan lintas generasi.\n\nHingga kini, Warung Lama H. Ridwan tetap menjadi salah satu destinasi wisata kuliner legendaris yang wajib dikunjungi ketika berada di Kota Malang. Keberhasilannya mempertahankan resep tradisional, lokasi bersejarah, dan pengelolaan keluarga selama lebih dari satu abad menjadikan warung ini sebagai bukti bahwa kuliner tidak hanya menghadirkan kelezatan, tetapi juga menjadi bagian penting dari identitas budaya dan sejarah Kota Malang.',
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
        'Warung Sate Gebug 1920 merupakan salah satu ikon kuliner legendaris Kota Malang yang telah berdiri sejak tahun 1920. Berlokasi di kawasan bersejarah Kayutangan, tepatnya di Jalan Jenderal Basuki Rahmat No. 113A, warung ini telah melewati berbagai periode sejarah, mulai dari masa kolonial Belanda hingga perkembangan Kota Malang saat ini. Usaha ini kini dikelola oleh generasi ketiga keluarga pendiri yang tetap mempertahankan resep dan teknik memasak warisan keluarga selama lebih dari satu abad. Bahkan bangunan yang digunakan masih mempertahankan bentuk aslinya dan termasuk bagian dari kawasan cagar budaya Kayutangan.\n\nKeunikan utama Warung Sate Gebug terletak pada teknik pengolahan daging sapi yang menjadi asal-usul namanya. Sebelum dibakar, daging sapi pilihan dipukul atau "digebug" hingga seratnya menjadi lebih lunak. Proses tradisional ini menghasilkan tekstur daging yang empuk tanpa menghilangkan cita rasa alaminya. Setelah itu, daging dibumbui dengan rempah-rempah khas dan dibakar di atas bara arang sehingga menghasilkan aroma yang khas dan menggugah selera. Teknik memasak tersebut tetap dipertahankan sejak awal berdiri dan menjadi identitas yang membedakan Sate Gebug dari sate sapi pada umumnya.\n\nSelain sate gebug, warung ini juga menyajikan berbagai hidangan berbahan dasar daging sapi seperti rawon, soto, dan sop. Pengunjung biasanya menikmati sate bersama kuah rawon atau soto, lengkap dengan tempe goreng dan mendol sebagai pelengkap. Perpaduan menu tersebut mencerminkan kekayaan kuliner khas Jawa Timur yang sederhana namun kaya cita rasa. Konsistensi kualitas bahan baku dan resep turun-temurun menjadi alasan mengapa Warung Sate Gebug tetap diminati oleh masyarakat lokal maupun wisatawan dari berbagai daerah.\n\nMengunjungi Warung Sate Gebug 1920 bukan hanya tentang menikmati hidangan, tetapi juga merasakan suasana kuliner tempo dulu di kawasan heritage Kayutangan. Bangunan klasik, proses pembakaran sate yang masih dilakukan secara tradisional, serta aroma daging yang mengepul dari tungku arang menghadirkan pengalaman yang autentik. Lokasinya yang berada di pusat Kota Malang juga menjadikannya mudah dijangkau dan sering menjadi tujuan wisata kuliner setelah menikmati kawasan bersejarah Kayutangan. Warung Sate Gebug 1920 menjadi salah satu destinasi wajib bagi wisatawan yang ingin mencicipi kuliner legendaris sekaligus menyaksikan tradisi memasak yang telah bertahan lebih dari seratus tahun.',
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
        'Orem-orem merupakan makanan khas Kota Malang, berupa sayur santan dengan bahan dasar tempe. Orem-orem biasanya dalam satu porsi berisi ketupat yang disiram dengan sayur santan, tempe, dan ayam, diberi taoge, kemudian dihidangkan bersama mendol atau tempe goreng. Orem-orem memiliki rasa yang pedas dan khas. Untuk melengkapinya, kamu bisa menambahkan kecap dan kerupuk.\n\nOrem-orem Arema buka setiap hari kecuali Jumat, mulai pukul 09.30 sampai 15.30 WIB. Satu porsi orem-orem di Orem-orem Arema berisi ketupat, disiram orem-orem tempe, ditambah ayam, dan tempe goreng. Kamu bisa memilih memakai telur atau biasa saja. Satu mangkuk orem-orem di Orem-orem Arema dibanderol mulai Rp8.000 sampai Rp12.000.\n\nKeistimewaan orem-orem terletak pada perpaduan tempe yang dimasak hingga bumbu meresap, kuah santan berwarna kuning dengan aroma serai dan daun jeruk, serta taburan bawang goreng yang memperkaya rasa gurih. Teknik memasak menggunakan api kecil membantu menghasilkan tekstur kuah yang lembut dan konsisten. Orem-orem bertahan karena identitasnya yang kuat sebagai sarapan khas Malang dan karena banyak warung masih dikelola keluarga lintas generasi.',
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
        'Rawon Brintik merupakan tempat makan rawon tertua di Malang. Warung nasi ini berdiri sejak 1942. Meski sudah berumur hampir 80 tahun, Rawon Brintik tetap mempertahankan cita rasa rawon yang masih sama enaknya seperti saat warung ini baru didirikan.\n\nBukan cuma rawon saja, Rawon Brintik juga menyediakan beberapa menu lain, seperti Semur Daging, Nasi Bumbu Rujak Ayam, Nasi Kare Ayam Kampung, dan Nasi Campur. Ada juga minuman yang cocok dipadukan dengan rawon, seperti kopi panas, teh, es jeruk, dan sirup. Satu porsi rawon dijual dengan kisaran harga Rp20.000-an.\n\nRawon di sini cenderung memiliki kuah yang gurih pekat (mlekoh) dengan daging yang sangat empuk dan potongan besar. Selain rawon, menu semur dagingnya juga menjadi favorit.',
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
      // Foto ke-3 tidak tersedia di folder â€” akan tampil placeholder
    ],
    latitude: -7.9724, // TODO: verifikasi koordinat
    longitude: 112.6316, // TODO: verifikasi koordinat
    desc:
        'Soto Ayam Lombok adalah salah satu ikon kuliner legendaris di Kota Malang yang telah berdiri sejak tahun 1955. Keunikan utama soto ini bukan karena rasanya yang pedas atau berasal dari pulau Lombok, melainkan karena kedai pertamanya berlokasi di Jalan Lombok No. 1, Kasin, Klojen.\n\nSoto khas Malang ini memiliki ciri khas kuah kuning yang kental, gurih kaya rempah, serta taburan koya kelapa (parutan kelapa yang disangrai/digoreng halus bersama bumbu), bukan koya kerupuk udang seperti soto Lamongan. Hidangan ini menggunakan potongan ayam kampung asli dan disajikan bersama irisan kentang rebus, telur, tauge, kubis, serta kerupuk melimpah.',
  ),

  // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€ EROPA â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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
        'Toko Oen merupakan salah satu ikon wisata kuliner sekaligus bangunan bersejarah di Kota Malang. Restoran ini didirikan pada tahun 1930 oleh keluarga Oen dan hingga kini tetap mempertahankan nuansa kolonial Belanda yang menjadi ciri khasnya. Berlokasi di Jalan Jenderal Basuki Rahmat, Toko Oen telah menjadi saksi perkembangan Kota Malang sejak masa kolonial hingga sekarang. Keaslian bangunan, tata ruang, hingga sebagian perabotnya masih dipertahankan sehingga pengunjung dapat merasakan suasana klasik yang sulit ditemukan di tempat lain.\n\nKeistimewaan Toko Oen tidak hanya terletak pada sejarahnya, tetapi juga pada kemampuannya mempertahankan resep-resep klasik selama puluhan tahun. Berbagai menu seperti es krim buatan sendiri, bistik, nasi goreng, dan aneka kue masih disajikan dengan cita rasa yang konsisten. Es krim menjadi menu paling ikonik karena dibuat menggunakan resep tradisional yang telah diwariskan secara turun-temurun dan menjadi daya tarik utama bagi wisatawan.\n\nSebagai salah satu restoran tertua di Malang, Toko Oen juga mencerminkan akulturasi budaya yang terjadi pada masa kolonial. Menu-menu Eropa dipadukan dengan hidangan Nusantara sehingga menghadirkan pengalaman kuliner yang unik. Perpaduan tersebut menunjukkan bagaimana budaya kuliner berkembang melalui interaksi berbagai kelompok masyarakat yang pernah hidup di Kota Malang.\n\nMengunjungi Toko Oen bukan sekadar menikmati makanan, tetapi juga merasakan atmosfer sejarah. Interior bergaya kolonial, meja dan kursi kayu klasik, jendela besar, serta berbagai ornamen lama menghadirkan pengalaman seolah kembali ke Malang pada awal abad ke-20. Tidak mengherankan jika restoran ini menjadi salah satu destinasi favorit wisatawan, pencinta sejarah, maupun fotografer.\n\nHingga kini, Toko Oen tetap mempertahankan identitasnya sebagai restoran bersejarah yang menyajikan perpaduan cita rasa klasik dan nilai budaya. Keberadaannya menjadi bukti bahwa kuliner tidak hanya berfungsi sebagai pemenuh kebutuhan pangan, tetapi juga sebagai media pelestarian sejarah, arsitektur, dan identitas Kota Malang.',
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
        'Restoran ini memiliki 2 kuliner legendaris yang memiliki unsur silang budaya Eropa, yaitu pastel tutup dan ayam kodok. Pastel tutup terinspirasi langsung dari Shepherd\'s Pie atau Cottage Pie asal Inggris dan Eropa Barat, yang menggunakan daging cincang dengan penutup kentang tumbuk (mashed potato). Nama "Pastel Tutup" diambil karena penutupnya terbuat dari adonan kentang yang menutup seluruh isian di bawahnya. Isian daging domba atau sapi cincang murni digantikan dengan isian lokal yang lebih bervariasi: daging ayam suwir, soun (pengaruh Tionghoa), jamur kuping, wortel, dan telur rebus. Adonan kentang di atasnya diolesi kuning telur dan dipanggang hingga kuning keemasan, menghasilkan rasa gurih legit yang sangat khas.\n\nSedangkan "Ayam Kodok" murni berasal dari metafora lokal karena bentuk ayam utuh yang melebar setelah dikeluarkan tulangnya menyerupai kodok yang sedang berjongkok. Hidangan ini diadaptasi dari teknik Galantine Prancis, sebuah hidangan mewah yang memerlukan keterampilan pisau tingkat tinggi (deboning) untuk mengeluarkan seluruh tulang ayam tanpa merobek kulitnya. Kulit ayam yang kosong diisi kembali dengan campuran daging ayam giling, daging sapi, roti tawar yang direndam dalam susu, dan telur rebus di bagian tengahnya. Ayam kemudian dikukus lalu dipanggang dengan olesan mentega dan kecap manis. Di Malang, menu ini adalah hidangan pesta (feestelijk) wajib untuk perayaan keluarga besar.',
  ),

  // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€ CINA â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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
        'Depot Han Tjwan Sing, atau lebih dikenal sebagai Depot HTS, merupakan salah satu kuliner legendaris di kawasan Lawang, Kabupaten Malang, yang telah berdiri sejak tahun 1927. Depot ini dirintis oleh Han Tjwan Sing, yang awalnya berhenti dari pekerjaannya di Pasuruan dan bersama istrinya memulai usaha kecil dengan menjual jamu serta aneka kue buatan rumah. Berkat kelezatan onde-onde buatannya, usaha tersebut berkembang pesat hingga membuka lapak di depan Pasar Lawang. Pada masa kolonial Belanda, onde-onde HTS bahkan menjadi camilan favorit masyarakat, termasuk pelanggan berkebangsaan Belanda yang sering singgah ketika melintasi jalur Surabayaâ€“Malang. Sejak tahun 1988, depot ini menempati bangunan yang lebih besar di Jalan Dr. Wahidin No. 123, Lawang, dan kini dikelola oleh generasi ketiga keluarga pendiri.\n\nKeistimewaan Depot HTS terletak pada kemampuannya mempertahankan resep keluarga selama hampir satu abad. Meskipun kini dikenal sebagai rumah makan yang menyajikan berbagai hidangan khas Jawa Timur, seperti rawon merah, rawon hitam, sop merah, semur lidah, dan nasi iga, identitas utamanya tetap melekat pada onde-onde legendaris yang menjadi produk andalan sejak awal berdiri. Onde-onde HTS memiliki kulit yang tipis dan lembut dengan isian kacang hijau, kacang merah, atau kelapa yang bercita rasa khas. Konsistensi rasa inilah yang membuat banyak pelanggan setia terus kembali, bahkan beberapa pelanggan keturunan Belanda masih menyempatkan berkunjung ketika datang ke Indonesia.\n\nDepot Han Tjwan Sing juga mencerminkan perjalanan panjang perkembangan kuliner di Malang Raya. Dari usaha rumahan sederhana, depot ini tumbuh menjadi salah satu destinasi kuliner legendaris yang tidak hanya menawarkan makanan, tetapi juga menyimpan nilai sejarah keluarga, ketekunan, dan tradisi. Perpaduan antara jajanan tradisional Tionghoa seperti onde-onde dengan menu masakan khas Jawa Timur menunjukkan bagaimana akulturasi budaya telah berlangsung secara alami dalam kehidupan masyarakat Malang sejak masa kolonial.\n\nMengunjungi Depot HTS memberikan pengalaman menikmati kuliner tempo dulu dalam suasana yang masih mempertahankan nuansa klasik. Bangunannya yang luas di jalur utama Surabayaâ€“Malang menjadikannya tempat persinggahan favorit wisatawan. Selain menikmati rawon merah yang menjadi menu khas depot, banyak pengunjung tidak lupa membawa pulang onde-onde sebagai oleh-oleh. Perpaduan cita rasa autentik, sejarah yang panjang, dan pengelolaan usaha secara turun-temurun menjadikan Depot Han Tjwan Sing sebagai salah satu ikon gastronomi yang memperkaya warisan kuliner Malang Raya dan tetap bertahan lintas generasi.',
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
        'Depot Hok Lay merupakan salah satu ikon kuliner legendaris di Kota Malang yang telah berdiri sejak tahun 1946. Didirikan oleh keluarga keturunan Tionghoa, depot ini berlokasi di Jalan KH Ahmad Dahlan No. 10, Klojen, dan hingga kini tetap mempertahankan bangunan bergaya kolonial dengan suasana klasik yang menjadi ciri khasnya. Nama "Hok Lay" berasal dari bahasa Hokkien yang berarti rezeki, mencerminkan harapan pendirinya agar usaha tersebut membawa keberkahan bagi keluarga. Selama hampir delapan dekade, Depot Hok Lay tetap menjadi salah satu destinasi kuliner favorit masyarakat Malang maupun wisatawan karena konsisten mempertahankan cita rasa, suasana, dan resep turun-temurun.\n\nKeistimewaan Depot Hok Lay terletak pada perpaduan kuliner Tionghoa dan cita rasa lokal Malang. Menu yang paling terkenal adalah Pangsit Cwie Mie, yaitu mi tipis dengan taburan ayam cincang yang disajikan bersama kuah kaldu gurih, serta Lumpia Semarang yang memiliki kulit renyah dengan isian rebung dan daging bercita rasa khas. Selain itu, Depot Hok Lay juga dikenal dengan minuman legendaris Fosco, perpaduan susu murni dan cokelat yang disajikan dingin dalam botol kaca, sebuah tradisi yang telah dipertahankan sejak masa awal berdirinya dan menjadi identitas yang tidak dapat dipisahkan dari depot ini.\n\nDepot Hok Lay menjadi contoh nyata akulturasi budaya yang berkembang di Kota Malang. Resep-resep keluarga Tionghoa dipadukan dengan selera masyarakat setempat sehingga melahirkan hidangan yang kini menjadi bagian dari identitas kuliner Malang. Tidak hanya cita rasanya yang dipertahankan, bangunan, perabot kayu, lantai tegel lama, hingga tata ruang depot juga tetap dijaga sehingga menghadirkan suasana nostalgia bagi para pengunjung. Keaslian inilah yang membuat Depot Hok Lay tidak sekadar menjadi tempat makan, tetapi juga menjadi bagian dari warisan budaya dan sejarah kota.\n\nBerkunjung ke Depot Hok Lay memberikan pengalaman menikmati kuliner tempo dulu yang masih bertahan hingga sekarang. Pengunjung dapat merasakan suasana hangat restoran keluarga sambil menikmati semangkuk Cwie Mie, Lumpia Semarang yang baru digoreng, dan segelas Fosco yang menjadi menu favorit lintas generasi. Meskipun berada di tengah pusat Kota Malang, depot ini tetap mempertahankan kesederhanaan dan nuansa klasiknya sehingga memberikan pengalaman yang berbeda dibandingkan restoran modern. Hingga saat ini, Depot Hok Lay tetap menjadi salah satu destinasi wisata kuliner yang wajib dikunjungi bagi siapa saja yang ingin mengenal sejarah, budaya, dan kekayaan gastronomi Kota Malang.',
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
        'Ronde Titoni merupakan salah satu ikon kuliner malam paling legendaris di Kota Malang yang telah berdiri sejak tahun 1948. Usaha ini dirintis oleh Abdul Hadi, yang pada awalnya menjajakan wedang ronde dan angsle dengan cara dipikul mengelilingi kawasan Pasar Besar Malang. Pada malam hari, beliau biasa berhenti berjualan di depan Toko Jam Titoni, sehingga masyarakat mulai menyebut dagangannya sebagai "Ronde Titoni". Nama tersebut kemudian melekat hingga sekarang dan menjadi identitas yang dikenal luas oleh masyarakat Malang maupun wisatawan. Seiring berkembangnya usaha, pada era 1970-an penjualan dilakukan menggunakan gerobak, sebelum akhirnya menetap di Jalan Zainul Arifin pada tahun 1988. Hingga kini, Ronde Titoni tetap dikelola oleh generasi penerus keluarga pendiri dengan mempertahankan resep warisan yang telah bertahan lebih dari tujuh dekade.\n\nKeistimewaan Ronde Titoni terletak pada cita rasa autentik wedang ronde yang masih mempertahankan resep tradisional. Semangkuk ronde disajikan dengan kuah jahe hangat yang harum dan kaya rempah, dipadukan dengan bola-bola ketan berisi kacang tanah yang lembut. Selain wedang ronde, kedai ini juga terkenal dengan angsle, yaitu minuman hangat berbahan dasar santan yang berisi roti tawar, kacang hijau, petulo, mutiara, dan kacang tanah. Berbagai menu pelengkap seperti ronde kering, kacang kuah, cakwe, dan roti goreng turut menjadi favorit pelanggan yang datang untuk menikmati suasana malam Kota Malang.\n\nRonde Titoni tidak hanya menawarkan hidangan penghangat tubuh, tetapi juga merepresentasikan tradisi kuliner hasil akulturasi budaya Tionghoa dan Jawa yang telah berkembang di Malang selama puluhan tahun. Wedang ronde berasal dari tradisi tangyuan masyarakat Tionghoa, namun dalam perkembangannya di Indonesia dipadukan dengan kuah jahe yang lebih kuat, sehingga sesuai dengan selera masyarakat lokal dan iklim Kota Malang yang sejuk. Keberhasilan mempertahankan resep, cara penyajian, dan suasana sederhana menjadikan Ronde Titoni sebagai salah satu warisan gastronomi yang memiliki nilai sejarah sekaligus budaya.\n\nBerkunjung ke Ronde Titoni menjadi pengalaman yang tidak terpisahkan dari wisata malam di Kota Malang. Setiap malam, kedai ini dipenuhi pengunjung dari berbagai kalangan, mulai dari warga lokal, mahasiswa, hingga wisatawan yang ingin menikmati hangatnya semangkuk ronde atau angsle di tengah udara sejuk Malang. Suasana sederhana, aroma jahe yang khas, serta resep yang tetap dipertahankan sejak 1948 menjadikan Ronde Titoni lebih dari sekadar tempat makan. Kehadirannya menjadi simbol bagaimana sebuah usaha keluarga dapat terus bertahan lintas generasi dan menjadi bagian penting dari identitas kuliner Kota Malang.',
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
        'Depot Pangsit Mie Bromo Pojok merupakan salah satu kuliner legendaris Kota Malang yang telah berdiri sejak tahun 1984. Awalnya, usaha ini berjualan di sebuah pojok perempatan Jalan Bromo, sehingga masyarakat mengenalnya dengan sebutan "Bromo Pojok". Meskipun pada awal tahun 1990-an lokasi usahanya dipindahkan ke Jalan Pattimura No. 53, nama tersebut tetap dipertahankan sebagai identitas yang melekat hingga kini. Berkat cita rasa yang konsisten dan pelanggan yang terus bertambah, Depot Pangsit Mie Bromo Pojok berkembang menjadi salah satu destinasi kuliner favorit di Malang dengan beberapa cabang di berbagai lokasi.\n\nKeistimewaan Depot Pangsit Mie Bromo Pojok terletak pada cwie mie khas Malang yang dibuat menggunakan mie produksi sendiri setiap hari sehingga menghasilkan tekstur yang kenyal, lembut, dan segar. Semangkuk cwie mie disajikan dengan ayam cincang berbumbu, selada, pangsit goreng renyah, serta kuah kaldu yang gurih. Selain mempertahankan menu klasik, depot ini juga menghadirkan berbagai variasi topping seperti ayam lada hitam, udang pedas, jamur, keju, hingga siomay, sehingga mampu mengikuti selera pelanggan tanpa menghilangkan cita rasa khas yang telah dikenal selama puluhan tahun. Salah satu menu pelengkap yang tidak kalah populer adalah es campur, yang menjadi favorit banyak pengunjung untuk menemani semangkuk mie hangat.\n\nDepot Pangsit Mie Bromo Pojok menjadi salah satu contoh bagaimana kuliner hasil akulturasi budaya Tionghoa dan Jawa berkembang menjadi bagian dari identitas gastronomi Kota Malang. Cwie mie sendiri merupakan adaptasi dari hidangan mi Tionghoa yang kemudian berkembang dengan cita rasa lokal, sehingga berbeda dengan bakmi dari daerah lain di Indonesia. Konsistensi dalam mempertahankan resep keluarga, penggunaan bahan baku berkualitas, serta proses pembuatan mie secara mandiri menjadikan depot ini tetap diminati lintas generasi dan menjadi salah satu rujukan utama ketika membahas kuliner khas Malang.\n\nBerkunjung ke Depot Pangsit Mie Bromo Pojok memberikan pengalaman menikmati salah satu kuliner paling ikonik di Kota Malang. Suasana depot yang sederhana dan bernuansa klasik mengingatkan pengunjung pada rumah makan keluarga yang telah bertahan selama puluhan tahun. Hingga kini, depot yang berlokasi di Jalan Pattimura No. 53 ini tetap ramai dikunjungi oleh masyarakat lokal maupun wisatawan yang ingin menikmati cita rasa autentik cwie mie Malang. Perpaduan sejarah, kualitas rasa, dan konsistensi pelayanan menjadikan Depot Pangsit Mie Bromo Pojok sebagai salah satu destinasi wisata kuliner yang wajib dikunjungi ketika berada di Kota Malang.',
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
        'Bakso President merupakan salah satu kuliner legendaris yang telah menjadi ikon Kota Malang sejak berdiri pada tahun 1977. Berlokasi di Jalan Batanghari No. 5, rumah makan ini memiliki keunikan yang sulit ditemukan di tempat lain karena berada tepat di samping jalur rel kereta api aktif. Setiap kali kereta melintas, pengunjung dapat merasakan pengalaman bersantap yang berbeda, menjadikan Bakso President tidak hanya terkenal karena cita rasanya, tetapi juga karena suasana khas yang menjadi daya tarik wisata.\n\nNama "President" berasal dari sebuah bioskop bernama President yang dahulu berada tidak jauh dari lokasi usaha. Pada awalnya, bakso ini dijual menggunakan gerobak sederhana di sekitar kawasan tersebut. Seiring bertambahnya pelanggan, usaha ini berkembang menjadi rumah makan yang kini dikenal sebagai salah satu destinasi kuliner wajib bagi wisatawan yang berkunjung ke Malang.\n\nBakso President dikenal dengan beragam pilihan menu, seperti bakso halus, bakso urat, bakso goreng, bakso bakar, siomay, tahu, hingga aneka jeroan yang dapat dipilih sesuai selera. Kuah kaldunya yang gurih dipadukan dengan bakso bertekstur kenyal menjadi ciri khas yang terus dipertahankan sejak awal berdiri. Selain itu, bakso bakar yang dibumbui manis gurih juga menjadi salah satu menu favorit dan telah menjadi ikon kuliner khas Malang.\n\nKeberadaan Bakso President menunjukkan bagaimana kuliner sederhana dapat berkembang menjadi bagian dari identitas kota. Tidak hanya menawarkan cita rasa yang konsisten selama puluhan tahun, tempat ini juga menyimpan nilai historis melalui perjalanan usahanya yang tumbuh bersama perkembangan Kota Malang. Lokasinya yang berdampingan dengan rel kereta api menciptakan pengalaman bersantap yang unik dan menjadi kenangan tersendiri bagi para pengunjung.\n\nHingga kini, Bakso President tetap menjadi salah satu tujuan wisata kuliner yang paling banyak dikunjungi di Kota Malang. Perpaduan antara cita rasa yang autentik, sejarah panjang, serta pengalaman makan di tepi rel kereta menjadikannya sebagai salah satu ikon gastronomi yang memperkaya daya tarik wisata Kota Malang.',
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
        'Depot Mie Gadjah Mada 1 adalah salah satu destinasi kuliner legendaris paling terkenal di Kota Malang. Berdiri sejak tahun 1950-an, tempat makan ini sangat populer dengan sajian pangsit mie (cwie mie) autentik khas Malang dengan mi buatan sendiri (homemade) yang kenyal tanpa bahan pengawet.\n\nDepot Mie Gadjah Mada menawarkan variasi menu terstruktur dengan rentang harga Rp25.000 hingga Rp65.000, yang sangat sepadan dengan porsi dan kualitas rasanya:\n\n- Pangsit Mie Ayam Jamur: menu klasik yang menjadi tolok ukur kelezatan depot ini.\n\n- Pangsit Mie Istimewa: pilihan terbaik untuk pencinta kuliner komplet. Disajikan dengan siomay basah, bakso, serta jeroan ayam.\n\n- Mie Kocok Gadjah Mada: mi kocok dengan kuah kental dan bumbu yang lebih berani.\n\n- Fosco (minuman legendaris): minuman cokelat susu retro dalam botol kaca Coca-Cola jadul. Rasanya unik: perpaduan manis, gurih, dan creamy.',
  ),
];
