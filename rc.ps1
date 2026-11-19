Write-Host "===> Dang cai dat Rclone va aria2c..." -ForegroundColor Cyan
choco install -y rclone aria2
if ($env:RCLONE_CONF) {
    $rcloneDir = "$env:USERPROFILE\AppData\Roaming\rclone"
    New-Item -ItemType Directory -Force -Path $rcloneDir | Out-Null
    Set-Content -Path "$rcloneDir\rclone.conf" -Value $env:RCLONE_CONF -Encoding Ascii
    Write-Host "===> Da nap file cau hinh rclone.conf thanh cong!" -ForegroundColor Green
} else {
    Write-Warning "Khong tim thay secret RCLONE_CONF trong GitHub Secrets!"
}

if ($env:TRANSFER_BAT) {
    $desktop = [Environment]::GetFolderPath("Desktop")
    $batPath = "$desktop\Start_Transfer.bat"
    
    [System.IO.File]::WriteAllText($batPath, $env:TRANSFER_BAT, [System.Text.Encoding]::ASCII)
    Write-Host "===> Da tao Start_Transfer.bat tu Secret len Desktop thanh cong!" -ForegroundColor Green
} else {
    Write-Warning "Khong tim thay secret TRANSFER_BAT trong GitHub Secrets!"
}
