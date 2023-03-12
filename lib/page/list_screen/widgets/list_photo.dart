import 'package:prueba/export/export.dart';
import 'package:prueba/page/list_screen/components/components.dart';
import 'package:prueba/page/list_screen/controller/list_controller_controller.dart';

class ListPhoto extends StatelessWidget {
  const ListPhoto({
    Key? key,
    required this.responsive,
    required this.controller,
  }) : super(key: key);

  final Responsive? responsive;
  final ListController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: controller.isLoadingCircular.value == true
            ? Center(
                child: controller.error.value == false
                    ? Container(
                        margin: EdgeInsets.only(top: responsive!.height(14)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        width: responsive!.width(100),
                        height: responsive!.height(83),
                        child: ListView.builder(
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          itemCount: controller.photos.length + 1,
                          itemBuilder: (context, index) {
                            if (index == controller.photos.length) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            final photo = controller.photos[index];
                            return ListPhotoItem(
                              photo: photo,
                              responsive: responsive,
                            );
                          },
                        ),
                      )
                    : messageError(context, responsive!, controller),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ListPhotoItem extends StatelessWidget {
  const ListPhotoItem({
    Key? key,
    required this.photo,
    required this.responsive,
  }) : super(key: key);

  final PhotoModel photo;
  final Responsive? responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      height: responsive!.width(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  photo.thumbnailUrl,
                ),
              ),
            ),
            Expanded(
              child: Text(
                photo.title!,
                maxLines: 3,
                style: AppStyle.listTitle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
