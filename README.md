Remove-CRTMP-Files
==================

This is a simple Powershell Script designed to remove Crystal Reports Temp files from a folder, and log with date and total size of removed files.

I've designed it to be run manually from the server itself. It could easily by automated by removing the prompt boxes and setting up a task in the task scheduler, but when I originally wrote it we were poking at the server twice a week or so anyway because the temp files were filling up storage.
