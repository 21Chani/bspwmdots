#/bin/sh!

script_path="$(cd "$(dirname "$0")/.." && pwd)"
file_path="$script_path/code_extensions.conf"

extensions=$(awk -F'[][]' '{print $5}' $file_path)

for extension in $extensions; do
    echo "[VSCODE INFO]Installing $extension..."
    code --install-extension $extension
done

