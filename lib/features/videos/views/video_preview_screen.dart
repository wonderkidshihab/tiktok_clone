import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

import '../view_models/upload_video_view_model.dart';

class VideoPreviewScreen extends ConsumerStatefulWidget {
  final XFile video;
  final bool isPicked;

  const VideoPreviewScreen({
    super.key,
    required this.video,
    required this.isPicked,
  });

  @override
  VideoPreviewScreenState createState() => VideoPreviewScreenState();
}

class VideoPreviewScreenState extends ConsumerState<VideoPreviewScreen> {
  late final VideoPlayerController _videoPlayerController;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _initVideo() async {
    _videoPlayerController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.setVolume(0);
    // await _videoPlayerController.play();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  // Future<void> _saveToGallery() async {
  //   if (_savedVideo) return;

  //   await GallerySaver.saveVideo(
  //     widget.video.path,
  //     albumName: "TikTok Clone!",
  //   );

  //   _savedVideo = true;

  //   setState(() {});
  // }

  void _onUploadPressed() async {
    ref.read(uploadVideoProvider.notifier).uploadVideo(
          File(widget.video.path),
          _titleController.text,
          _descriptionController.text,
          context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Preview video'),
        actions: [
          // if (!widget.isPicked)
          //   IconButton(
          //     onPressed: _saveToGallery,
          //     icon: FaIcon(
          //       _savedVideo
          //           ? FontAwesomeIcons.check
          //           : FontAwesomeIcons.download,
          //     ),
          //   ),
          IconButton(
            onPressed: ref.watch(uploadVideoProvider).isLoading
                ? () {}
                : _onUploadPressed,
            icon: ref.watch(uploadVideoProvider).isLoading
                ? const CircularProgressIndicator()
                : const FaIcon(FontAwesomeIcons.cloudArrowUp),
          )
        ],
      ),
      body: _videoPlayerController.value.isInitialized
          ? Stack(children: [
              VideoPlayer(_videoPlayerController),
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                    ),
                    controller: _titleController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                    ),
                    controller: _descriptionController,
                  ),
                ],
              ),
            ])
          : null,
    );
  }
}
