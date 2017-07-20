Add-Type -AssemblyName System.IO.Compression.FileSystem
$WC = New-Object System.Net.WebClient
'================================================================='
'|     Welcome to GenisysPro install script for Windows          |'
'| We strong suggest you use Linux instead of Microsoft Windows  |'
'================================================================='
sleep 1
Try{
'Fetching latest GenisysPro phar...'
[xml]$gitlabinfo = $WC.DownloadString("https://gitlab.com/GenisysPro/GenisysPro/builds/artifacts/master/download?job=phar")
$buildnumber = $gitlabinfo.freeStyleProject.lastSuccessfulBuild.number
"Latest successful build number is #$buildnumber"
'Downloading GenisysPro...'
$WC.DownloadFile("https://gitlab.com/GenisysPro/GenisysPro/builds/artifacts/master/download?job=phar",".\GenisysPro.phar")
'Done!'
'Downloading PHP runtime...'
$WC.DownloadFile("https://storage.googleapis.com/itx-technologies-141911.appspot.com/php_for_genisys%2Fphp_windows_x86_7.0.17.zip?raw=true",".\php.zip")
'Extracting...'
[System.IO.Compression.ZipFile]::ExtractToDirectory(".\php.zip", ".\")
'Cleaning...'
rm php.zip
'Done!'
'Downloading Startup Script'
$WC.DownloadFile("https://raw.githubusercontent.com/GenisysPro/GenisysPro/master/start.cmd",".\start.cmd")
'Done!'
'Downloading　VS2012...'
$WC.DownloadFile("https://www.dropbox.com/s/3ras5kdz6vqfl44/vc_redist.x86.exe?dl=0",".\vcredist_x86.exe")
'Done!'
}
Catch{
'Something went wrong, please restart this script later'
sleep 5
exit
}
'All have done! Run start.cmd for your new server!'
'If it said to be'
''
'/usr/bin/php/php.exe: error while loading shared libraries: MSVCR110.dll: cannot open shared object file: No such file or directory'
''
'please install vcredist_x86.exe.'

sleep 5
rm Windows-Installer.ps1
exit
