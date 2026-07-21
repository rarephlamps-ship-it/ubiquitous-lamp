from pathlib import Path

path = Path("app/src/main/java/dk/ruko/ondskabensskov/GameView.java")
source = path.read_text(encoding="utf-8")

method = '''    private void showMessage(String text, float seconds) {
        message = text == null ? "" : text;
        messageTime = Math.max(0.1f, seconds);
    }

'''
marker = "    private void drawMessage(Canvas canvas){\n"

if "private void showMessage(String text, float seconds)" not in source:
    if marker not in source:
        raise RuntimeError("Could not locate drawMessage insertion marker")
    source = source.replace(marker, method + marker, 1)
    path.write_text(source, encoding="utf-8")

if source.count("private void showMessage(String text, float seconds)") != 1:
    raise RuntimeError("showMessage patch validation failed")

print("GameView.java patch applied and validated")
