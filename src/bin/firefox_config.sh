#/bin/sh!

# Apps array
apps=(
    "github"
    "whatsapp-web"
    "vercel"
    "instagram"
    "youtube"
    "chatgpt"
)

for app in "${apps[@]}"; do

    # Open page for installation:
    firefox -new-tab "https://github.com/catppuccin/userstyles/raw/main/styles/${app}/catppuccin.user.css"

done
