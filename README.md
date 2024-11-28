

# MiniAlarm - A Lightweight Rainmeter Alarm Skin

MiniAlarm is a simple and lightweight Rainmeter skin designed to help you set quick alarms directly on your desktop. It integrates seamlessly with Rainmeter, offering an intuitive interface and customizable settings.

---

## 🌟 Features

- 📅 **Alarm Management**: Set one-time or recurring alarms.
- ⏰ **Customizable Notifications**: Get notified with a visual alert and/or sound.
- 🎨 **Minimalistic Design**: Clean and compact UI for your desktop.
- 🔧 **Customizable Skins**: Easily tweak fonts, colors, and sounds to your liking.
- 💡 **Lightweight**: Designed to have minimal system impact.

---

## 🖥️ Requirements

- [Rainmeter](https://www.rainmeter.net/) (version 4.5 or newer).
- Windows 10 or later (Windows 10/11 recommended).

---

## 🚀 Installation

1. **Download the Skin**:
   - Head over to the [Releases](https://github.com/NSTechBytes/MiniAlarm/releases) section and download the latest `.rmskin` file.

2. **Install the Skin**:
   - Double-click the downloaded `.rmskin` file to open the Rainmeter Skin Installer.
   - Follow the prompts to install MiniAlarm.

3. **Load the Skin**:
   - Open the Rainmeter Manager (`Right-click the Rainmeter tray icon -> Manage`).
   - Locate **MiniAlarm** in the list of installed skins.
   - Load the desired layout (e.g., `MiniAlarm`).

---

## 📖 How to Use

1. **Set an Alarm**:
   - Use the input field in the MiniAlarm skin to specify the alarm time (e.g., `07:30 ` or `15:00`).
   - Click the "Set Alarm" button.

2. **Stop or Snooze**:
   - When the alarm goes off, you will see a notification.
   - Use the "Stop" or "Snooze" options as needed.

3. **Customize the Skin**:
   - Load `Config\Main.ini` from the Rainmeter Manager.
   - Adjust settings like alarm sounds, font styles, and colors.

---

## 🔧 Configuration

The MiniAlarm skin supports the following customizations:

### General Settings
| Option                | Default Value | Description                               |
|-----------------------|---------------|-------------------------------------------|
| **AlarmSound**        | `alarm.mp3`   | Path to the alarm sound file.             |
| **DateFormat**        | `hh:mm tt`    | Time format for the alarm.                |
| **BackgroundColor**   | `#000000`     | Background color of the alarm interface.  |

You can find and edit these options in the **MiniAlarm.ini** file within the skin folder.

---

## 🛠️ Development Notes

### Plugin Integration
MiniAlarm integrates with the custom plugin **Alarm** (written in C#). It checks for the active state of the "MiniAlarm" skin and performs additional tasks when necessary.

To contribute, you'll need:
- Visual Studio with the C# development environment set up.
- The Rainmeter SDK for plugin development.





## 📷 Screenshots

### Main Interface
![MiniAlarm Interface](https://github.com/NSTechBytes/Projects-Templates/blob/main/RainmeterSkins/MiniAlarm/Screenshot%20(185).png)

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m "Add new feature"`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a Pull Request.

---

## 📄 License

This project is licensed under the [Appache](LICENSE). Feel free to use, modify, and distribute it as you see fit.

---

## 🗨️ Feedback and Support

Have questions or feedback? Feel free to:
- Open an issue in the [Issues](https://github.com/NSTechBytes/MiniAlarm/issues) section.
