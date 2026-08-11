import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/destination_dropdown.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/error_handler.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/no_data.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/search_input.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/template_page.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/modules/culture/domain/dto/culture_item_dto.dart';
import 'package:oldcityguideapp/core/modules/culture/presentation/viewmodels/culture_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:provider/provider.dart';

class CultureScreen extends StatefulWidget {
  const CultureScreen({super.key});

  @override
  State<CultureScreen> createState() => _CultureScreenState();
}

class _CultureScreenState extends State<CultureScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CultureViewmodel>().fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CultureViewmodel>();
    final state = context.watch<CultureViewmodel>().state;
    final padding = const EdgeInsets.symmetric(horizontal: 20);
    return TemplatePage(
        title: "Silang Budaya",
        child: switch (state) {
          Loading<List<CultureItemDto>>() =>
            Center(child: CircularProgressIndicator()),
          Error<List<CultureItemDto>>(message: final message) => ErrorHandler(
              message: message,
              onRetry: () {
                viewModel.fetchData();
              }),
          Success<List<CultureItemDto>>(data: final dto) => Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchInput(
                        onSearch: (keyword) {
                          viewModel.search(keyword);
                        },
                        placeHolder: "Cari budaya")
                    .pading(
                  padding.copyWith(top: 24),
                ),
                DestinationPicker(onSelect: (id) {
                  viewModel.filterByDestination(id);
                }).pading(padding),
                Expanded(
                  child: Visibility(
                    visible: dto.isNotEmpty,
                    replacement: Center(
                      child: NoData(),
                    ),
                    child: ListView.separated(
                        padding: padding.copyWith(top: 20),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              tileColor: Colors.white,
                              onTap: () => context.pushNamed('/culture/detail',
                                  queryParameters: {'id': index.toString()}),
                              title: Text(dto[index].name),
                              trailing: FaIcon(FontAwesomeIcons.chevronRight));
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 12,
                            ),
                        itemCount: dto.length),
                  ),
                )
              ],
            )
        });
  }
}

class PersonItem extends StatefulWidget {
  const PersonItem({super.key});

  @override
  State<PersonItem> createState() => _PersonItemState();
}

class _PersonItemState extends State<PersonItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFefefef),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/person/daya.png',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Daya Negri Wijaya",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: FaIcon(
                  isExpanded
                      ? FontAwesomeIcons.chevronUp
                      : FontAwesomeIcons.chevronDown,
                ),
              ),
            ],
          ).pading(const EdgeInsets.all(8)),
          Visibility(
            visible: isExpanded,
            child: Text(
              style: TextStyle(color: Colors.grey),
              softWrap: true,
              "Staf Pengajar di Departemen Sejarah Fakultas Ilmu Sosial Universitas Negeri Malang (2014 - Sekarang). Dia mendapatkan gelar Sarjana Pendidikan Sejarah dari Universitas Negeri Malang pada 2011, Sarjana Sastra Inggris dari Universitas Brawijaya pada 2016, Magister Ilmu Sejarah (Master of Arts in History) dari The University of Sunderland, United Kingdom pada 2013; dan Doktor Ilmu Sejarah (Doutor em Historia) di Universidade do Porto, Portugal pada 2022. Selain menjabat sebagai Kepala Pusat Ekonomi, Humaniora, dan Pariwisata (PEHP) Lembaga Penelitian dan Pengabdian Kepada Masyarakat (LPPM) Universitas Negeri Malang (2024-Sekarang), juga aktif melakukan penelitian dalam bidang sejarah kolonial khususnya Ekspansi Portugis ke Nusantara. Menjadi peneliti tamu di Southeast Asian Research Center and Hub (SEARCH), De La Salle University, Manila.  Selain itu, beliau juga aktif dalam berbagai organisasi profesi seperti Ikatan Alumni Perhimpunan Pelajar Indonesia (IA-PPI), Perkumpulan Ahli Epigrafi Indonesia (PAEI), Masyarakat Sejarawan Indonesia (MSI), Perkumpulan Prodi Pendidikan Sejarah Se-Indonesia (P3SI), Perkumpulan Prodi Ilmu Sejarah Se-Indonesia (PPSI), Perkumpulan Periset Karavan Cendekia, dan Pakasa Pangeran Timur Madiun. Selain menulis berbagai historiografi, kini beliau aktif untuk mempopulerkan sejarah melalui film dokumenter, seperti: Sylvia Saartje: Lady Rocker Indonesia (2021-nomine film dokumenter terbaik pada FFI 2022), Soedjatmoko: Jejak Kultural Budaya (2021), Hula Keta: Bukan Maluku Tanpa Sagu (2023), Ran: Panglima Rasa Pesta Begawe (2023), Sendang Malang di Cekung Gunung (2023), Genti Malai: Kampung Melayu Portugis (2023). ",
            ).pading(const EdgeInsets.all(8)),
          ),
        ],
      ),
    ).pading(const EdgeInsets.symmetric(horizontal: 16));
  }
}
