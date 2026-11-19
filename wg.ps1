          if (-not $env:WIREGUARD_CONF) {
            Write-Warning "Secret WIREGUARD_CONF chua duoc cau hinh trong GitHub Secrets!"
          }
          New-Item -ItemType Directory -Force -Path "C:\wireguard" | Out-Null
          Set-Content -Path "C:\wireguard\wg0.conf" -Value $env:WIREGUARD_CONF -Encoding Ascii
