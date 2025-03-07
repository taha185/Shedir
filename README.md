
# Shedir - Forensic IP Lookup Tool

**Shedir** is a noir-themed command-line utility for IP address analysis, designed to provide forensic-style intelligence with a focus on operational security. Built for cybersecurity professionals and enthusiasts, it combines investigative storytelling with actionable network data.

---

## 🕵️ Features

### Noir Detective Interface
- Custom ASCII Art Banner
- Case File Agreement Screen
- Investigation-Themed Terminology (e.g., "Suspect Profile," "Digital Footprint")

### Technical Capabilities
- WHOIS Lookup with Geotagging
- Network Operator/ISP Identification
- Connection Verification & Dependency Checks
- Persistent Case File Outputs (JSON/TXT)

---

## 🛠️ Installation

### Kali Linux / ParrotOS
```bash
git clone https://github.com/taha185/Shedi.git
cd Shedi
chmod +x Shedir.sh
sudo ./Shedir.sh
```

### Dependencies
- `whois`
- `curl`
- `jq`

Install missing dependencies:  
```bash
sudo apt install whois curl jq -y
```

---

## 📖 Usage
```bash
sudo ./Shedir.sh
```
Follow the interactive prompts to:
1. Accept the "case agreement"
2. Input a target IP address
3. Review forensic analysis

---

## 📦 Packaging for Distribution

### Create DEB Package
```bash
mkdir -p shedir_1.0-1/usr/local/bin
cp Shedir.sh shedir_1.0-1/usr/local/bin/shedir
dpkg-deb --build shedir_1.0-1
```

### Submission Guidelines
| Platform       | Requirements                          | Submission Link                     |
|----------------|---------------------------------------|-------------------------------------|
| **Kali Linux** | GPL-3.0 License, manpage, systemd     | [Kali GitLab](https://gitlab.com/kalilinux/packages) |
| **ParrotOS**   | Debian-compatible package, CLI polish | [Parrot Community](https://community.parrotsec.org/) |

---

## 🤝 Contributing
1. Fork the [repository](https://github.com/taha185/Shedi)
2. Create a feature branch:  
   ```bash
   git checkout -b feature/noir-module
   ```
3. Submit a pull request with:  
   - Detailed commit messages
   - Updated documentation
   - Passing functionality tests

---

## 📜 License
Licensed under **GNU GPLv3**. See [LICENSE](LICENSE) for details.

---

## 📍 Roadmap
- [ ] Kali/ParrotOS Repository Inclusion
- [ ] IPv6 Support
- [ ] Tor Network Analysis Module

---

## 📬 Contact
- **Developer**: Taha ([@taha185](https://github.com/taha185))
- **Email**: [taha185185@gmail.com](mailto:taha185185@gmail.com)
- **Community**: Star ⭐ the repo to support Kali/ParrotOS adoption!

---

*"In the shadows of the digital world, every IP hides a story."* 🔍
