# 🎨 Converter Usage Guide

Step-by-step instructions for converting between **SCSS**, **CSS**, and **Stylus** formats.

---

## ✅ Prerequisites

### 1. Check Your Environment
Ensure you have access to a **bash shell**:

- **Windows** → Use **Git Bash** or **WSL**
- **Mac/Linux** → Use **Terminal** (bash is included by default)

---

### 2. Make Scripts Executable
Navigate to the `src/util/` directory and run:


## 🚀 Conversion Commands

### 🔹 SCSS → CSS
```bash
./scss-converter.sh path/to/input.scss path/to/output.css
```

### 🔹 SCSS → Stylus
```bash
./scss-converter.sh path/to/input.scss path/to/output.styl
```

### 🔹 CSS → Stylus
```bash
./scss-converter.sh path/to/input.css path/to/output.styl
```

---

## ⚠️ Important Notes

- Ensure the **output directory already exists**
- The script **will NOT create directories automatically**