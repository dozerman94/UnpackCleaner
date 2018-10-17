# UnpackCleaner
 
This is a bash script that will remove old files that were extracted from `.rar` files. It basically tries to undo what the [ruTorrent Unpack Plugin](https://github.com/Novik/ruTorrent/wiki/PluginUnpack) does. It should also work with other BitTorrent extractors, if the files are extracted to the directory the rar file is located in.

### What it does
For every subdirectory:
 - If there are `.rar` files and there are any files of the types defined in `extractedtypes` it will remove those files.
 - If there are no `.rar` files it will not remove anything.
 - It ignores files with `sample` in their name.

Use at your own risk, as this script might remove files that were not extracted under some circumstances. 


