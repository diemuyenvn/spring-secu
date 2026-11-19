Write-Host "===> Dang cai dat Rclone va aria2c..." -ForegroundColor Cyan
choco install -y rclone aria2
# 1. Nạp file cấu hình Rclone
if ($env:RCLONE_CONF) {
    $rcloneDir = "$env:USERPROFILE\AppData\Roaming\rclone"
    New-Item -ItemType Directory -Force -Path $rcloneDir | Out-Null
    Set-Content -Path "$rcloneDir\rclone.conf" -Value $env:RCLONE_CONF -Encoding Ascii
    Write-Host "===> Da nap file cau hinh rclone.conf thanh cong!" -ForegroundColor Green
} else {
    Write-Warning "Khong tim thay secret RCLONE_CONF trong GitHub Secrets!"
}
