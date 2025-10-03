reg Query "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper;
wget "https://t3.ftcdn.net/jpg/01/93/91/96/360_F_193919655_JYOhhGqiFmMRSkA7RP6kaFhDp93pqJQz.jpg" -OutFile "$env:USERPROFILE/green.jpg";
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "$env:USERPROFILE/green.jpg" /f;
$settings = Get-Process -Name SystemSettings -ErrorAction SilentlyContinue;
if (-not $settings) {
  Start-Process "ms-settings:";
  Start-Sleep -Seconds 1;
}
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name 'WallPaper' -Value "$env:USERPROFILE/green.jpg";
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name 'WallpaperStyle' -Value 2;
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name 'TileWallpaper' -Value 0;
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters 1, True;
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters;
if (-not $settings) {
  Start-Sleep -Seconds 1; 
  Stop-Process -Name "SystemSettings";
}                                          
