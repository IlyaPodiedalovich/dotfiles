# Chezmoi Notes

## SDDM Autologin Fix (Hyprland + UWSM)

Что исправлено:
- Настроен автоматический вход в сессию `hyprland-uwsm.desktop`.

Шаги:
1. Установить `uwsm`.
2. Создать файл `/etc/sddm.conf.d/10-autologin.conf` со следующим содержимым:

```ini
[Autologin]
User=ilya
Session=hyprland-uwsm.desktop
```

Проверка:
- Выполнить `systemctl is-enabled sddm`.
- Выполнить `systemctl is-active sddm`.
- Перезагрузить систему и убедиться, что вход выполняется сразу в Hyprland.

Откат:
- Удалить файл `/etc/sddm.conf.d/10-autologin.conf`.

Примечание:
- SDDM технически остается первым шагом, потому что именно display manager запускает этап аутентификации.
- `hyprlock` запускается уже после старта пользовательской сессии Hyprland, поэтому он не заменяет вход через SDDM.
