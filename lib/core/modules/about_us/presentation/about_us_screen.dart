import 'package:oldcityguideapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:oldcityguideapp/core/common/presentation/widgets/template_page.dart';
import 'package:oldcityguideapp/core/modules/about_us/domain/dto/user_profile_dto.dart';
import 'package:oldcityguideapp/core/modules/about_us/presentation/viewmodels/about_us_viewmodel.dart';
import 'package:oldcityguideapp/core/ui/ui_state.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final locale = Localizations.localeOf(context).languageCode;
      context.read<AboutUsViewmodel>().setLocaleAndFetch(locale);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context).languageCode;
    context.read<AboutUsViewmodel>().setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AboutUsViewmodel>().users;

    return TemplatePage(
      title: AppLocalizations.of(context)!.aboutUsTitle,
      child: switch (state) {
        Loading<List<UserProfileDto>>() =>
          const Center(child: CircularProgressIndicator()),
        Error<List<UserProfileDto>>(message: final error) =>
          Text(error).pading(const EdgeInsets.all(20)),
        Success<List<UserProfileDto>>(data: final dto) =>
          CustomScrollView(
            slivers: [
              // Header judul tim
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                  child: Text(
                    AppLocalizations.of(context)!.aboutUsTeam,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),

              // Grid 2 kolom responsif
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent:
                        MediaQuery.of(context).size.width > 700 ? 300 : 220,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.72,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final data = dto[index];
                      return _PersonCard(
                        data: data,
                        onTap: () => _showDetail(context, data),
                      );
                    },
                    childCount: dto.length,
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          ),
      },
    );
  }

  void _showDetail(BuildContext context, UserProfileDto data) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _PersonDetailSheet(data: data),
    );
  }
}

/// Kartu ringkas di grid
class _PersonCard extends StatelessWidget {
  final UserProfileDto data;
  final VoidCallback onTap;

  const _PersonCard({required this.data, required this.onTap});

  Widget _buildPhoto(double height) {
    if (data.isLocalAsset && data.imageAsset.isNotEmpty) {
      return Image.asset(
        data.imageAsset,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _fallback(height),
      );
    }
    if (data.imageUrl.isNotEmpty) {
      return Image.network(
        'https://oldcityguideapp.my.id/${data.imageUrl}',
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _fallback(height),
      );
    }
    return _fallback(height);
  }

  Widget _fallback(double height) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.grey[300],
      child: const Icon(Icons.person, size: 48, color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: const Color(0xFFefefef),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto — proporsi 3:4
            Expanded(child: _buildPhoto(double.infinity)),

            // Info nama + indikator ketuk
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.info_outline,
                          size: 12, color: Colors.blueGrey),
                      const SizedBox(width: 4),
                      Text(
                        Localizations.localeOf(context).languageCode == 'en'
                            ? 'View profile'
                            : 'Lihat profil',
                        style:
                            const TextStyle(fontSize: 11, color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bottom sheet profil lengkap
class _PersonDetailSheet extends StatelessWidget {
  final UserProfileDto data;
  const _PersonDetailSheet({required this.data});

  Widget _buildPhoto() {
    const double size = 80;
    Widget photo;
    if (data.isLocalAsset && data.imageAsset.isNotEmpty) {
      photo = Image.asset(
        data.imageAsset,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _fallback(size),
      );
    } else if (data.imageUrl.isNotEmpty) {
      photo = Image.network(
        'https://oldcityguideapp.my.id/${data.imageUrl}',
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _fallback(size),
      );
    } else {
      photo = _fallback(size);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: photo,
    );
  }

  Widget _fallback(double size) {
    return Container(
      width: size,
      height: size,
      color: Colors.grey[300],
      child: const Icon(Icons.person, size: 40, color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, controller) {
        return Column(
          children: [
            // Handle
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 16),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Foto + nama
            _buildPhoto(),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                data.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(height: 1),

            // Deskripsi scrollable
            Expanded(
              child: SingleChildScrollView(
                controller: controller,
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                child: Text(
                  data.description,
                  style: const TextStyle(
                      fontSize: 14, height: 1.6, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
