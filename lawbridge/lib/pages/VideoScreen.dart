import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  MediaStream? _localStream;

  @override
  void initState() {
    super.initState();
    _initializeRenderers();
    _startLocalStream();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    _localStream?.dispose();
    super.dispose();
  }

  Future<void> _initializeRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  Future<void> _startLocalStream() async {
    try {
      final Map<String, dynamic> mediaConstraints = {
        'audio': true,
        'video': {
          'facingMode': 'user',
        },
      };

      final stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
      setState(() {
        _localStream = stream;
        _localRenderer.srcObject = stream;
        _remoteRenderer.srcObject = stream; // Simulating a remote stream
      });
    } catch (e) {
      print('Error accessing camera or microphone: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Widget _buildVideoView(RTCVideoRenderer renderer) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: RTCVideoView(
        renderer,
        objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Remote video
          Align(
            alignment: Alignment.center,
            child: _buildVideoView(_remoteRenderer),
          ),

          // Local video (small overlay)
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              width: 120,
              height: 160,
              child: _buildVideoView(_localRenderer),
            ),
          ),

          // Call action buttons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.mic_off,
                  color: Colors.red,
                  onPressed: () {
                    // Mute functionality
                    _localStream?.getAudioTracks().forEach((track) {
                      track.enabled = !track.enabled;
                    });
                  },
                ),
                _buildActionButton(
                  icon: Icons.call_end,
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context); // End call
                  },
                ),
                _buildActionButton(
                  icon: Icons.videocam_off,
                  color: Colors.red,
                  onPressed: () {
                    // Disable video functionality
                    _localStream?.getVideoTracks().forEach((track) {
                      track.enabled = !track.enabled;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white,
        child: Icon(icon, color: color, size: 28),
      ),
    );
  }
}
