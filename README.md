<div align="center">

<img src="https://lumichats.com/logo.png" width="80" height="80" alt="LumiChats Logo"/>

# LumiChats Offline LLM

### Run Powerful AI Models Privately — No Internet. No GPU. No Cloud.

[![License: MIT](https://img.shields.io/badge/License-MIT-orange.svg)](https://opensource.org/licenses/MIT)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows%2010%2F11-blue.svg)](https://github.com/adityajhakumar/LumiChats-Offline-LLM)
[![Built on GPT4All](https://img.shields.io/badge/Built%20on-GPT4All-orange.svg)](https://github.com/nomic-ai/gpt4all)
[![Models on HuggingFace](https://img.shields.io/badge/Models-HuggingFace-yellow.svg)](https://huggingface.co/adityakum667388)
[![Website](https://img.shields.io/badge/Website-lumichats.com-orange.svg)](https://lumichats.com)

**[⬇️ Download Latest Release](https://drive.google.com/file/d/1cNY8gWysIEtwtxa2T80fn2gAaFkI_Qu5/view?usp=drive_link)** · **[🌐 Website](https://lumichats.com)** · **[🤗 Our Models](https://huggingface.co/adityakum667388)** · **[👨‍💻 Developer](https://github.com/adityajhakumar)**

---

</div>

## 🔥 What is LumiChats Offline?

**LumiChats Offline** is a free, open-source desktop application that lets you run state-of-the-art AI language models **entirely on your Windows PC** — with zero internet connection, zero cloud dependency, and zero data collection.

Your conversations never leave your device. Your data is yours. Forever.

Built on top of the powerful [GPT4All](https://github.com/nomic-ai/gpt4all) engine by Nomic AI, LumiChats Offline extends it with:

- 🟠 **LumiChats brand identity** — clean, modern UI with orange accent design
- 🌑 **Ultra-dark mode** — true deep dark theme for low-light environments  
- 🔒 **Enhanced privacy defaults** — all telemetry and data sharing disabled by default
- 📄 **LocalDocs integration** — chat with your own PDFs, Word files, and text documents
- 🤗 **Fine-tuned LumiChats models** — purpose-built open-source models optimized for real-world tasks
- 🖥️ **CPU-only inference** — runs on any modern Windows PC, no GPU required

---

## ✨ Key Features

| Feature | Description |
|--------|-------------|
| 🔌 **Fully Offline** | Zero internet required after initial model download |
| 🔐 **Privacy First** | Your chats never leave your machine |
| 🧠 **Multi-Model Support** | Qwen, LLaMA, Mistral, DeepSeek, Granite, and more |
| 📂 **LocalDocs (RAG)** | Chat with your own files using local retrieval |
| ⚡ **CPU Optimized** | No GPU needed — runs on everyday hardware |
| 🆓 **100% Free** | Open source, no subscriptions, no paywalls |
| 🤗 **LumiChats Models** | Fine-tuned models designed for instruction following |

---

## ⬇️ Download & Run (Windows)

### Option 1 — Direct Download (Recommended for most users)

> No installation needed. Just download, extract, and run.

**[📦 Download LumiChats Offline v1.1 for Windows](https://drive.google.com/file/d/1cNY8gWysIEtwtxa2T80fn2gAaFkI_Qu5/view?usp=drive_link)**

1. Download the zip from the link above
2. Extract the folder anywhere on your PC
3. Double-click `chat.exe`
4. Go to **Models** tab → download a model
5. Start chatting! 🎉

**System Requirements:**
- Windows 10 or Windows 11 (64-bit)
- 8 GB RAM minimum (16 GB recommended)
- 5–10 GB free disk space per model
- No GPU required

---

### Option 2 — Clone & Build from Source

```bash
# Clone the repository
git clone https://github.com/adityajhakumar/LumiChats-Offline-LLM.git
cd LumiChats-Offline-LLM
```

**Prerequisites:**
- Visual Studio 2022 (Desktop development with C++ workload)
- CMake 3.21+
- Qt 6.8+ (install via aqtinstall)
- Python 3.10+

```bash
# Install Qt
pip install aqtinstall
aqt install-qt windows desktop 6.8.3 win64_msvc2022_64 -O C:\Qt --archives qtbase qtdeclarative qtsvg
aqt install-qt windows desktop 6.8.3 win64_msvc2022_64 -O C:\Qt --modules qthttpserver qtlanguageserver qtshadertools qtquick3d qtwebsockets qtpdf qt5compat

# Configure and build (run in x64 Native Tools Command Prompt)
cmake -S gpt4all-chat -B build ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_PREFIX_PATH="C:\Qt\6.8.3\msvc2022_64" ^
  -DLLMODEL_CUDA=OFF ^
  -DLLMODEL_VULKAN=OFF ^
  -DGPT4ALL_TEST=OFF

cmake --build build --config Release --parallel

# Deploy Qt dependencies
C:\Qt\6.8.3\msvc2022_64\bin\windeployqt.exe build\bin\Release\chat.exe --qmldir gpt4all-chat\qml
```

Your EXE will be at: `build\bin\Release\chat.exe`

---

## 🤗 LumiChats Fine-Tuned Models

We have developed a suite of open-source models fine-tuned specifically for LumiChats use cases, available freely on Hugging Face:

| Model | Type | Size | Link |
|-------|------|------|------|
| LumiChats-Instruct-4B LoRA | Text Generation | 4B | [🤗 View](https://huggingface.co/adityakum667388/LumiChats-Instruct-4B_lora) |
| LumiChats v1.2 7B 4-bit | Text Generation | 8B | [🤗 View](https://huggingface.co/adityakum667388/lumichats-v1.2-7b-bnb-4bit) |
| LumiChats v1.3 11B Vision | Image-to-Text | 11B | [🤗 View](https://huggingface.co/adityakum667388/lumichats_v1.3_11b_vision) |
| LumiChats 4Bz v1.4 | Text Generation | 4B | [🤗 View](https://huggingface.co/adityakum667388/lumichats_4Bz_v1.4) |
| LumiChats Coder v2.1 | Code Generation | 2B | [🤗 View](https://huggingface.co/adityakum667388/lumichat_coder-v2.1) |
| LumiChats TTS 1B | Text-to-Speech | 1B | [🤗 View](https://huggingface.co/adityakum667388/lumichats_TTS_1B_finetune_16bit) |

> All models are free, open-source, and can be used with LumiChats Offline or any compatible GGUF runner.

---

## 🏗️ Architecture & Technical Details

LumiChats Offline is built on top of **GPT4All v3.10** by Nomic AI, with the following customizations and enhancements:

### UI & Branding
- Complete UI rebrand to LumiChats identity (orange `#F97316` accent color)
- Ultra-dark mode with near-OLED black backgrounds (`#0D0D0D`)
- Redesigned home screen with LumiChats branding
- Removed third-party analytics and telemetry prompts
- All external links updated to lumichats.com

### Backend
- CPU-only inference pipeline (CUDA and Vulkan disabled)
- llama.cpp-based inference engine (mainline branch)
- nomic-embed-text-v1.5 embedding model for LocalDocs
- Supports GGUF model format

### Privacy & Security
- All data sharing opt-ins **disabled by default**
- News feed pointed to lumichats.com instead of third-party servers
- No tracking, no analytics, no telemetry

---

## 📁 Repository Structure

```
LumiChats-Offline-LLM/
├── chat.exe                    # Main application executable
├── llmodel.dll                 # Core LLM inference library
├── llamamodel-mainline-cpu.dll # LLaMA CPU backend
├── Qt6*.dll                    # Qt6 runtime libraries
├── qml/                        # QML UI plugins
├── resources/                  # Embedding model resources
├── platforms/                  # Platform-specific plugins
├── imageformats/               # Image format plugins
├── translations/               # Localization files
└── gpt4all-chat/               # Source code (UI layer)
    ├── qml/                    # QML UI files
    │   ├── HomeView.qml        # Home screen
    │   ├── Theme.qml           # LumiChats color theme
    │   ├── ChatView.qml        # Chat interface
    │   └── ...
    └── src/                    # C++ source files
        ├── main.cpp            # Application entry point
        └── download.cpp        # Model/news download manager
```

---

## 🚀 Getting Started

### Step 1 — Launch the app
Double-click `chat.exe`

### Step 2 — Install a model
Click **Models** in the sidebar → **+ Add Model** → choose a model and download it.

**Recommended models for beginners:**
- **Qwen2 1.5B** — Fast, lightweight, great for quick tasks (900 MB)
- **LumiChats v1.1** — Our custom fine-tuned model (3B)
- **Mistral 7B** — High quality general purpose (4 GB)

### Step 3 — Start chatting
Click **Chats** → **+ New Chat** → select your model → start typing!

### Step 4 — Use LocalDocs (optional)
Click **LocalDocs** → add a folder of PDF/Word/text files → chat with your documents privately.

---

## 🙏 Attribution & Academic Citation

LumiChats Offline is built on top of **GPT4All**, an open-source project by Nomic AI. We extend our sincere gratitude to the Nomic AI team and all contributors for their foundational work.

If you use this software in academic research, please cite the original GPT4All project:

```bibtex
@misc{gpt4all,
  author = {Anand, Yuvanesh and Nussbaum, Zach and Duderstadt, Brandon and Schmidt, Benno and Mulyar, Andriy and Beeching, Edward and Sherburn, Richard and Van Bortel, Jared and Boothby, Brian and Sheng, Tony and others},
  title = {GPT4All: An Ecosystem of Open Source Compressed Language Models},
  year = {2023},
  publisher = {Nomic AI},
  howpublished = {\url{https://github.com/nomic-ai/gpt4all}},
}
```

**Original Project:** [https://github.com/nomic-ai/gpt4all](https://github.com/nomic-ai/gpt4all)  
**License:** MIT License — see [LICENSE.txt](LICENSE.txt)

---

## ⚖️ Legal & Compliance

- This project is a **derivative work** of GPT4All, used under the **MIT License**
- All original GPT4All code retains its original copyright by Nomic AI and contributors
- LumiChats-specific modifications are copyright © 2025 LumiChats
- Model weights downloaded through the app are subject to their respective licenses
- This software is provided as-is, without warranty of any kind

---

## 🤝 Contributing

Contributions are welcome! Here's how:

1. Fork this repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "feat: add your feature"`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a Pull Request

---

## 📬 Contact & Links

<div align="center">

| Platform | Link |
|----------|------|
| 🌐 Website | [lumichats.com](https://lumichats.com) |
| 🤗 Hugging Face | [huggingface.co/adityakum667388](https://huggingface.co/adityakum667388) |
| 💼 LinkedIn | [Aditya Kumar Jha](https://www.linkedin.com/in/aditya-kumar-jha-b0b669252) |
| 🐙 GitHub | [adityajhakumar](https://github.com/adityajhakumar) |

</div>

---

<div align="center">

Made with ❤️ by [LumiChats](https://lumichats.com) · Built on [GPT4All](https://github.com/nomic-ai/gpt4all) by Nomic AI

**⭐ Star this repo if you find it useful!**

</div>
