if (-not $env:RCLONE_CONF) {
  Write-Warning "Secret RCLONE_CONF chua duoc cau hinh trong GitHub Secrets!"
}
$rcloneDir = "$env:USERPROFILE\AppData\Roaming\rclone"
New-Item -ItemType Directory -Force -Path $rcloneDir | Out-Null
Set-Content -Path "$rcloneDir\rclone.conf" -Value $env:RCLONE_CONF -Encoding Ascii
