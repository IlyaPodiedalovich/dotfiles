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

## Убрать дополнительный запрос пароля после входа 

৭ Authentication required

An application wants access to the keyring “Связка ключей по умолчанию”, but it is locked

для того чтоб это отключить 

```
sudo pacman -S seahorse
```
открываем seehorse, жмем на связка ключей по умолчанию пкм и меняем пароль на пустой. 
