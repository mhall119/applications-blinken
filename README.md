# applications-blinken
Snappy packaging blinken

Needs devmode for dbus but appears fully functional minus sound with brief testing.

Issues:
Without --devmode:
"Couldn't register name 'org.kde.blinken-14972' with DBUS - another process owns it already!"

With --devmode:
Found metadata in lib /snap/blinken/x5/usr/lib/x86_64-linux-gnu/qt5/plugins/phonon4qt5_backend/phonon_gstreamer.so, metadata=
{
    "IID": "org.kde.phonon.gstreamer",
    "MetaData": {
        "Icon": "phonon-gstreamer",
        "InitialPreference": 15,
        "InterfaceVersion": 0,
        "Name": "Phonon GStreamer",
        "Version": "4.8.2",
        "Website": "http://gstreamer.freedesktop.org"
    },
    "className": "Backend",
    "debug": false,
    "version": 328961
}


loaded library "/snap/blinken/x5/usr/lib/x86_64-linux-gnu/qt5/plugins/phonon4qt5_backend/phonon_gstreamer.so"
Phonon::GStreamer::Backend: Failed to initialize GStreamer
WARNING: Phonon::createPath: Cannot connect  Phonon::MediaObject ( no objectName ) to  Phonon::AudioOutput ( no objectName )


Changelog:
6/22/2016
    - Fixed web browser launch for help
    - Improved automation for snapcraft.yaml file generation.
    - More debugging of phonon gstreamer plugins non-functionality.
    - Added snapcraft-kubuntu for builds that work with cleanbuild.
