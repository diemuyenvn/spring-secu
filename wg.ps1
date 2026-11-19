Write-Host "===> Dang cai dat WireGuard..." -ForegroundColor Cyan
choco install -y wireguard

if ($env:WIREGUARD_CONF) {
    New-Item -ItemType Directory -Force -Path "C:\wireguard" | Out-Null
    Set-Content -Path "C:\wireguard\wg0.conf" -Value $env:WIREGUARD_CONF -Encoding Ascii
    Write-Host "===> Da nap file cau hinh C:\wireguard\wg0.conf thanh cong!" -ForegroundColor Green
} else {
    Write-Warning "Khong tim thay secret WIREGUARD_CONF trong GitHub Secrets!"
}
